#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWalletActionActivatedEventArgs.ahk
#Include .\IActivatedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!CAUTION]
  * > The Activation.WalletActionActivatedEventArgs class is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
  * 
  * Provides information to an app that was launched as the result of a wallet action.
 * @remarks
 * You access a WalletActionActivatedEventArgs object when you implement an event handler that responds to [Activated](../windows.applicationmodel.core/coreapplicationview_activated.md) events when [ActivationKind](activationkind.md) is **WalletAction**.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.walletactionactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class WalletActionActivatedEventArgs extends IInspectable {
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
     * Gets the ID of the [WalletItem](../windows.applicationmodel.wallet/walletitem.md) on which the user performed the action.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.walletactionactivatedeventargs.itemid
     * @type {HSTRING} 
     */
    ItemId {
        get => this.get_ItemId()
    }

    /**
     * Gets the action that was performed on the [WalletItem](../windows.applicationmodel.wallet/walletitem.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.walletactionactivatedeventargs.actionkind
     * @type {Integer} 
     */
    ActionKind {
        get => this.get_ActionKind()
    }

    /**
     * Gets the ID of the action, such as the id of the verb, transaction and so on.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.walletactionactivatedeventargs.actionid
     * @type {HSTRING} 
     */
    ActionId {
        get => this.get_ActionId()
    }

    /**
     * Gets the type of action that was performed on the [WalletItem](../windows.applicationmodel.wallet/walletitem.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.walletactionactivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before it was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.walletactionactivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets the splash screen object which provides information about the transition from the splash screen to the activated app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.walletactionactivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
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

;@endregion Instance Methods
}
