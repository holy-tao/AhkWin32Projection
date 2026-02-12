#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewControlLongRunningScriptDetectedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [IWebViewControl.LongRunningScriptDetected](iwebviewcontrol_longrunningscriptdetected.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrollongrunningscriptdetectedeventargs
 * @namespace Windows.Web.UI
 * @version WindowsRuntime 1.4
 */
class WebViewControlLongRunningScriptDetectedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewControlLongRunningScriptDetectedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewControlLongRunningScriptDetectedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of milliseconds that the [IWebViewControl](iwebviewcontrol.md) has been executing a long-running script.
     * @remarks
     * If the script is still running after 5 seconds, the app will hang. To halt the script, set the [StopPageScriptExecution](webviewcontrollongrunningscriptdetectedeventargs_stoppagescriptexecution.md) property to true. The halted script will not resume for the lifetime of the [IWebViewControl](iwebviewcontrol.md) unless it is reloaded during a subsequent [IWebViewControl](iwebviewcontrol.md) navigation.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrollongrunningscriptdetectedeventargs.executiontime
     * @type {TimeSpan} 
     */
    ExecutionTime {
        get => this.get_ExecutionTime()
    }

    /**
     * Halts a long-running script executing in a [IWebViewControl](iwebviewcontrol.md).
     * @remarks
     * The halted script will not resume for the lifetime of the [IWebViewControl](iwebviewcontrol.md) unless it is reloaded during a subsequent [IWebViewControl](iwebviewcontrol.md) navigation. If the script is still running after 5 seconds, the app will hang. To determine how long the script has been running, check the [ExecutionTime](webviewcontrollongrunningscriptdetectedeventargs_executiontime.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrollongrunningscriptdetectedeventargs.stoppagescriptexecution
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
        if (!this.HasProp("__IWebViewControlLongRunningScriptDetectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlLongRunningScriptDetectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlLongRunningScriptDetectedEventArgs := IWebViewControlLongRunningScriptDetectedEventArgs(outPtr)
        }

        return this.__IWebViewControlLongRunningScriptDetectedEventArgs.get_ExecutionTime()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_StopPageScriptExecution() {
        if (!this.HasProp("__IWebViewControlLongRunningScriptDetectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlLongRunningScriptDetectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlLongRunningScriptDetectedEventArgs := IWebViewControlLongRunningScriptDetectedEventArgs(outPtr)
        }

        return this.__IWebViewControlLongRunningScriptDetectedEventArgs.get_StopPageScriptExecution()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_StopPageScriptExecution(value) {
        if (!this.HasProp("__IWebViewControlLongRunningScriptDetectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlLongRunningScriptDetectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlLongRunningScriptDetectedEventArgs := IWebViewControlLongRunningScriptDetectedEventArgs(outPtr)
        }

        return this.__IWebViewControlLongRunningScriptDetectedEventArgs.put_StopPageScriptExecution(value)
    }

;@endregion Instance Methods
}
