#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\ApplicationModel\Activation\IUserDataAccountProviderActivatedEventArgs.ahk
#Include ..\..\ApplicationModel\Activation\IActivatedEventArgs.ahk
#Include .\IActivatedEventArgsDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data when an app is activated to manage user accounts.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiuserdataaccountprovideractivatedeventargs
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class WebUIUserDataAccountProviderActivatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataAccountProviderActivatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataAccountProviderActivatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the user account provider operation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiuserdataaccountprovideractivatedeventargs.operation
     * @type {IUserDataAccountProviderOperation} 
     */
    Operation {
        get => this.get_Operation()
    }

    /**
     * Gets the activation type.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiuserdataaccountprovideractivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before it was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiuserdataaccountprovideractivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets the splash screen object, which provides information about the transition from the splash screen to the activated app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiuserdataaccountprovideractivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

    /**
     * Gets the operation that activated the app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiuserdataaccountprovideractivatedeventargs.activatedoperation
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
     * @returns {IUserDataAccountProviderOperation} 
     */
    get_Operation() {
        if (!this.HasProp("__IUserDataAccountProviderActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IUserDataAccountProviderActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccountProviderActivatedEventArgs := IUserDataAccountProviderActivatedEventArgs(outPtr)
        }

        return this.__IUserDataAccountProviderActivatedEventArgs.get_Operation()
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
