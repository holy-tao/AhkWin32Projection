#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewLongRunningScriptDetectedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [WebView.LongRunningScriptDetected](webview_longrunningscriptdetected.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewlongrunningscriptdetectedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class WebViewLongRunningScriptDetectedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewLongRunningScriptDetectedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewLongRunningScriptDetectedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of milliseconds that the [WebView](webview.md) control has been executing a long-running script.
     * @remarks
     * If the script is still running after 5 seconds, the app will hang. To halt the script, set the [StopPageScriptExecution](webviewlongrunningscriptdetectedeventargs_stoppagescriptexecution.md) property to **true**. The halted script will not resume for the lifetime of the [WebView](webview.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewlongrunningscriptdetectedeventargs.executiontime
     * @type {TimeSpan} 
     */
    ExecutionTime {
        get => this.get_ExecutionTime()
    }

    /**
     * Halts a long-running script executing in a [WebView](webview.md) control.
     * @remarks
     * The halted script will not resume for the lifetime of the [WebView](webview.md). If the script is still running after 5 seconds, the app will hang. To determine how long the script has been running, check the [ExecutionTime](webviewlongrunningscriptdetectedeventargs_executiontime.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewlongrunningscriptdetectedeventargs.stoppagescriptexecution
     * @type {Boolean} 
     */
    StopPageScriptExecution {
        get => this.get_StopPageScriptExecution()
        set => this.put_StopPageScriptExecution(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_ExecutionTime() {
        if (!this.HasProp("__IWebViewLongRunningScriptDetectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewLongRunningScriptDetectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewLongRunningScriptDetectedEventArgs := IWebViewLongRunningScriptDetectedEventArgs(outPtr)
        }

        return this.__IWebViewLongRunningScriptDetectedEventArgs.get_ExecutionTime()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_StopPageScriptExecution() {
        if (!this.HasProp("__IWebViewLongRunningScriptDetectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewLongRunningScriptDetectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewLongRunningScriptDetectedEventArgs := IWebViewLongRunningScriptDetectedEventArgs(outPtr)
        }

        return this.__IWebViewLongRunningScriptDetectedEventArgs.get_StopPageScriptExecution()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_StopPageScriptExecution(value) {
        if (!this.HasProp("__IWebViewLongRunningScriptDetectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewLongRunningScriptDetectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewLongRunningScriptDetectedEventArgs := IWebViewLongRunningScriptDetectedEventArgs(outPtr)
        }

        return this.__IWebViewLongRunningScriptDetectedEventArgs.put_StopPageScriptExecution(value)
    }

;@endregion Instance Methods
}
