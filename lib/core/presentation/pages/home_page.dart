import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';
import 'package:sigmavpnflutter/core/data/local_storage.dart';
import 'package:sigmavpnflutter/core/data/model/firebase_file.dart';
import 'package:sigmavpnflutter/core/localization/language/languages.dart';
import 'package:sigmavpnflutter/core/presentation/components/connected_status_widget.dart';
import 'package:sigmavpnflutter/core/presentation/components/download_and_upload_widget.dart';
import 'package:sigmavpnflutter/core/presentation/components/empty_state_widget.dart';
import 'package:sigmavpnflutter/core/presentation/components/navigation_drawer_widget.dart';
import 'package:sigmavpnflutter/core/presentation/components/vpn_connected_status_widget.dart';
import 'package:sigmavpnflutter/core/presentation/components/waiting_status_widget.dart';
import 'package:sigmavpnflutter/core/services/firebase_storage.dart';
import 'package:sigmavpnflutter/core/services/initialize_remote_config.dart';
import 'package:sigmavpnflutter/core/theme/colors.dart';
import 'package:sigmavpnflutter/core/theme/svg_paths.dart';
import 'package:sigmavpnflutter/core/theme/text_styles.dart';

class VpnPage extends StatefulWidget {
  const VpnPage({Key? key}) : super(key: key);

  @override
  State<VpnPage> createState() => _VpnPageState();
}

class _VpnPageState extends State<VpnPage> {
  late OpenVPN engine;
  VpnStatus? status;
  VpnStatus? firstStatusIn = VpnStatus.empty();
  VpnStatus? firstStatusOut = VpnStatus.empty();
  VpnStatus? emptyStatus = VpnStatus.empty();
  VpnStatus? lastStatus;
  VPNStage? stage;
  String config = "";
  Timer? timer;
  double differenceIn = 0;
  double differenceOut = 0;
  Random random = Random();
  String serverName = "";
  bool isConnected = false;

  late Future<List<FirebaseFile>> futureFiles;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    InitializeRemoteConfig.init();
    InitializeRemoteConfig.remoteConfigInitialize();
    UserPreferences.init();
    futureFiles = FirebaseApi.listAll("ovpn_files/");
    engine = OpenVPN(
      onVpnStatusChanged: (data) {
        status = data;

        if (status != null) {
          differenceIn = double.parse(status!.byteIn.toString()) -
              double.parse(firstStatusIn!.byteIn.toString());

          differenceOut = double.parse(status!.byteOut.toString()) -
              double.parse(firstStatusOut!.byteOut.toString());

          setState(() {
            // status = data;
            firstStatusIn = status;
            firstStatusOut = status;
          });
        }
      },
      onVpnStageChanged: (data, raw) {
        setState(() {
          stage = data;
        });
      },
    );

    engine.initialize(
      groupIdentifier: "group.com.sigma.vpn2",
      providerBundleIdentifier: "com.sigma.vpn2.VPNExtension",
      localizedDescription: "SigmaVPN",
      lastStage: (stage) {
        setState(() {
          this.stage = stage;
        });
      },
      lastStatus: (status) {
        lastStatus = status;

        setState(() {
          this.status = status;
        });
      },
    );

    super.initState();
  }

  Future<void> initPlatformState({String serverName = ""}) async {
    print('serverName - $serverName');
    engine.connect(config, serverName,
        username: FirebaseApi.defaultVpnUsername,
        password: FirebaseApi.defaultVpnPassword,
        certIsRequired: true);

    isConnected = await engine.isConnected();
    setState(() {});

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {},
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const NavigationDrawerWidget(),
        resizeToAvoidBottomInset: false,
        backgroundColor: secondaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: secondaryColor,
          elevation: 0,
          title: RichText(
            text: TextSpan(
              text: Languages.of(context)!.home_title_1,
              // style: wRegularS22primary,
              children: [
                TextSpan(
                  text: Languages.of(context)!.home_title_2,
                  // style: wBoldS22White
                ),
              ],
            ),
          ),
          leading: CupertinoButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            child: SvgPicture.asset(
              drawerButtonSVG,
              height: 24,
              width: 24,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),

              DownloadAndUploadRow(
                status: status,
              ),

              SizedBox(
                height: screenHeightRatio(60, context),
              ),

              if (stage == VPNStage.disconnected ||
                  stage == VPNStage.denied ||
                  stage == VPNStage.error) ...[
                FutureBuilder<List<FirebaseFile>>(
                    future: futureFiles,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const WaitingStatusWidget();
                        default:
                          if (snapshot.hasError) {
                            return EmptyStateWidget(
                              engine: engine,
                              status: Languages.of(context)!.home_disconnecting,
                            );
                          } else {
                            final files = snapshot.data!;
                            return ConnectedStatusWidget(
                              onPressed: () async {
                                // final randomNumber = random.nextInt(files.length);
                                final randomNumber = random.nextInt(17);
                                setState(() {
                                  serverName =
                                      InitializeRemoteConfig.getServerName(
                                          randomNumber);
                                });
                                UserPreferences.setServerName(serverName);
                                config = await FirebaseApi.downloadFile(
                                    files[randomNumber].ref);
                                await initPlatformState(serverName: serverName);
                              },
                            );
                          }
                      }
                    },),
              ] else if (stage == VPNStage.connecting ||
                  stage == VPNStage.tcp_connect ||
                  stage == VPNStage.udp_connect ||
                  stage == VPNStage.assign_ip ||
                  stage == VPNStage.vpn_generate_config ||
                  stage == VPNStage.wait_connection ||
                  stage == VPNStage.authenticating ||
                  (Platform.isAndroid &&
                      stage == VPNStage.unknown &&
                      isConnected == false)) ...[
                EmptyStateWidget(
                  engine: engine,
                  status: Languages.of(context)!.home_connection_message,
                ),
              ] else if (stage == VPNStage.disconnecting ||
                  (Platform.isAndroid &&
                      stage == VPNStage.unknown &&
                      isConnected == true)) ...[
                EmptyStateWidget(
                  engine: engine,
                  status: Languages.of(context)!.home_disconnecting,
                ),
              ] else if (stage == VPNStage.connected) ...[
                VpnConnectedStatusWidget(
                    serverName: serverName, engine: engine),
              ],

              // if (Platform.isAndroid)
              //   TextButton(
              //     child: Text(_granted ? "Granted" : "Request Permission"),
              //     onPressed: () {
              //       engine. ().then((value) {
              //         setState(() {
              //           _granted = value;
              //         });
              //       });
              //     },
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
