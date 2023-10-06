import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '../../themes/app_colors.dart';
import '../../themes/fonts.dart';
import '../../themes/borders.dart';




class BlogFullDetailsView extends StatefulWidget {
  final String id;
  final String title;
  final String image;
  const BlogFullDetailsView({super.key, required this.id, required this.title, required this.image});

  @override
  State<BlogFullDetailsView> createState() => _BlogFullDetailsViewState(this.title, this.image);
}

class _BlogFullDetailsViewState extends State<BlogFullDetailsView> {
  late final WebViewController _controller;
  var _title;
  var _image;
  _BlogFullDetailsViewState(this._title, this._image);

  @override
  void initState() {
    super.initState();

    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
    WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
          onUrlChange: (UrlChange change) {
            debugPrint('url change to ${change.url}');
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse('https://www.google.com/search?q=$_title+in+subspace&sca_esv=571003301&rlz=1C1GCEA_en-GBIN1070IN1070&sxsrf=AM9HkKn7mRFfbUipJOxmTHPoKN9-_TtdPA%3A1696527538612&ei=svQeZeKCJdvg1e8PlqCu2Ag&ved=0ahUKEwjio6nKud-BAxVbcPUHHRaQC4sQ4dUDCBE&uact=5&oq=top+5+ways+to+save+money+from+subscriptions+in+subspace&gs_lp=Egxnd3Mtd2l6LXNlcnAiN3RvcCA1IHdheXMgdG8gc2F2ZSBtb25leSBmcm9tIHN1YnNjcmlwdGlvbnMgaW4gc3Vic3BhY2UyBRAhGKABMgUQIRigATIFECEYoAEyBRAhGKABSO8kUIgDWNcfcAF4AJABAJgB8gGgAbgDqgEFMC4xLjG4AQPIAQD4AQHCAgoQABhHGNYEGLAD4gMEGAAgQYgGAZAGCA&sclient=gws-wiz-serp'));

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(10),
      //   child: AppBar(
      //     title: Text(_title),
      //   ),
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppColors.bgLightGrey,
            alignment: Alignment.centerLeft,
            height: 40,
            child: const Text("   Blog details",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: AppColors.textHeading,
                  fontSize: Fonts.fontSize24,
                  fontWeight: Fonts.f700
              ),),
          ),
          Expanded(child: Container(
            decoration: BoxDecoration(
              border: borders.b_3px_green,
            ),
            child: WebViewWidget(controller: _controller),
          )),
        ],
      ),
    );
  }
}

