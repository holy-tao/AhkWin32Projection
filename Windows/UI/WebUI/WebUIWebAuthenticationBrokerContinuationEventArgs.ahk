#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\ApplicationModel\Activation\IWebAuthenticationBrokerContinuationEventArgs.ahk
#Include ..\..\ApplicationModel\Activation\IContinuationActivatedEventArgs.ahk
#Include ..\..\ApplicationModel\Activation\IActivatedEventArgs.ahk
#Include .\IActivatedEventArgsDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information to an app that was launched after being suspended for a web authentication broker operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiwebauthenticationbrokercontinuationeventargs
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class WebUIWebAuthenticationBrokerContinuationEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebAuthenticationBrokerContinuationEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebAuthenticationBrokerContinuationEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the WebAuthenticationResult object returned from the web authentication broker operation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiwebauthenticationbrokercontinuationeventargs.webauthenticationresult
     * @type {WebAuthenticationResult} 
     */
    WebAuthenticationResult {
        get => this.get_WebAuthenticationResult()
    }

    /**
     * Gets a set of values populated by the app before a web authentication broker operation that deactivates the app in order to provide context when the app is activated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiwebauthenticationbrokercontinuationeventargs.continuationdata
     * @type {ValueSet} 
     */
    ContinuationData {
        get => this.get_ContinuationData()
    }

    /**
     * Gets the activation type.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiwebauthenticationbrokercontinuationeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before it was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiwebauthenticationbrokercontinuationeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets the splash screen object that provides information about the transition from the splash screen to the activated app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiwebauthenticationbrokercontinuationeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

    /**
     * Gets the app activation operation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiwebauthenticationbrokercontinuationeventargs.activatedoperation
     * @type {ActivatedOperation} 
     */
    ActivatedOperation {
        get => this.get_ActivatedOperation()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {WebAuthenticationResult} 
     */
    get_WebAuthenticationResult() {
        if (!this.HasProp("__IWebAuthenticationBrokerContinuationEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebAuthenticationBrokerContinuationEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAuthenticationBrokerContinuationEventArgs := IWebAuthenticationBrokerContinuationEventArgs(outPtr)
        }

        return this.__IWebAuthenticationBrokerContinuationEventArgs.get_WebAuthenticationResult()
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_ContinuationData() {
        if (!this.HasProp("__IContinuationActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IContinuationActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContinuationActivatedEventArgs := IContinuationActivatedEventArgs(outPtr)
        }

        return this.__IContinuationActivatedEventArgs.get_ContinuationData()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedEventArgs := IActivatedEventArgs(outPtr)
        }

        return this.__IActivatedEventArgs.get_Kind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PreviousExecutionState() {
        if (!this.HasProp("__IActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedEventArgs := IActivatedEventArgs(outPtr)
        }

        return this.__IActivatedEventArgs.get_PreviousExecutionState()
    }

    /**
     * 
     * @returns {SplashScreen} 
     */
    get_SplashScreen() {
        if (!this.HasProp("__IActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedEventArgs := IActivatedEventArgs(outPtr)
        }

        return this.__IActivatedEventArgs.get_SplashScreen()
    }

    /**
     * 
     * @returns {ActivatedOperation} 
     */
    get_ActivatedOperation() {
        if (!this.HasProp("__IActivatedEventArgsDeferral")) {
            if ((queryResult := this.QueryInterface(IActivatedEventArgsDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedEventArgsDeferral := IActivatedEventArgsDeferral(outPtr)
        }

        return this.__IActivatedEventArgsDeferral.get_ActivatedOperation()
    }

;@endregion Instance Methods
}
