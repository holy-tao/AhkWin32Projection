#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\ApplicationModel\Activation\IWalletActionActivatedEventArgs.ahk
#Include ..\..\ApplicationModel\Activation\IActivatedEventArgs.ahk
#Include .\IActivatedEventArgsDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!CAUTION] 
  * > The WebUI.WebUIWalletActionActivatedEventArgs class is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
  * 
  * Provides information to an app that was launched as the result of a wallet action.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiwalletactionactivatedeventargs
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class WebUIWalletActionActivatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWalletActionActivatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWalletActionActivatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID of the WalletItem on which the user performed the action.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiwalletactionactivatedeventargs.itemid
     * @type {HSTRING} 
     */
    ItemId {
        get => this.get_ItemId()
    }

    /**
     * Gets the action that was performed on the WalletItem.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiwalletactionactivatedeventargs.actionkind
     * @type {Integer} 
     */
    ActionKind {
        get => this.get_ActionKind()
    }

    /**
     * Gets the ID of the action, such as the id of the verb, transaction and so on.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiwalletactionactivatedeventargs.actionid
     * @type {HSTRING} 
     */
    ActionId {
        get => this.get_ActionId()
    }

    /**
     * Gets the activation type.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiwalletactionactivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before it was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiwalletactionactivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets the splash screen object that provides information about the transition from the splash screen to the activated app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiwalletactionactivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

    /**
     * Gets the app activation operation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiwalletactionactivatedeventargs.activatedoperation
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
     * @returns {HSTRING} 
     */
    get_ItemId() {
        if (!this.HasProp("__IWalletActionActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWalletActionActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletActionActivatedEventArgs := IWalletActionActivatedEventArgs(outPtr)
        }

        return this.__IWalletActionActivatedEventArgs.get_ItemId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ActionKind() {
        if (!this.HasProp("__IWalletActionActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWalletActionActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletActionActivatedEventArgs := IWalletActionActivatedEventArgs(outPtr)
        }

        return this.__IWalletActionActivatedEventArgs.get_ActionKind()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ActionId() {
        if (!this.HasProp("__IWalletActionActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWalletActionActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletActionActivatedEventArgs := IWalletActionActivatedEventArgs(outPtr)
        }

        return this.__IWalletActionActivatedEventArgs.get_ActionId()
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
