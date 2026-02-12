#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify whether [WebView](webview.md) hosts HTML content on the UI thread or on a non-UI thread.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewexecutionmode
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class WebViewExecutionMode extends Win32Enum{

    /**
     * Content is hosted on the UI thread.
     * @type {Integer (Int32)}
     */
    static SameThread => 0

    /**
     * Content is hosted on a background thread.
     * @type {Integer (Int32)}
     */
    static SeparateThread => 1

    /**
     * Content is hosted on a separate process off the app process. All of an app's WebView instances share the same separate process, there is not a separate process per WebView instance.
     * @type {Integer (Int32)}
     */
    static SeparateProcess => 2
}
