#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWalletVerb.ahk
#Include .\IWalletVerbFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!CAUTION]
  * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
  * 
  * Represents a wallet verb, which is potentially used for app activation. This is a string suitable for UI that is descriptive of the action.
 * @remarks
 * You can associate verbs, such as "register", "pay with" with an item in the wallet. When the user selects a verb, your app is activated. The selected verb is passed to an app as part of activation (in the [WalletActionActivatedEventArgs](../windows.applicationmodel.activation/walletactionactivatedeventargs.md) data, as the [ActionId](../windows.applicationmodel.activation/walletactionactivatedeventargs_actionid.md) value, and [ActionKind](../windows.applicationmodel.activation/walletactionactivatedeventargs_actionkind.md) will be **Verb**).
 * 
 * > [!NOTE]
 * > JavaScript apps use [WebUIWalletActionActivatedEventArgs](../windows.ui.webui/webuiwalletactionactivatedeventargs.md).
 * 
 * A WalletVerb object represents the individual items for the [WalletItem.Verbs](walletitem_verbs.md) property.
 * 
 * The verb is a cue to the app of which UI to display on activation, which might be specific to the verb that was chosen by the user.
 * 
 * For more info on using **Wallet** activation, see the "Handling app activation by Wallet " section of [Quickstart: Using the   APIs](/previous-versions/windows/apps/dn631257(v=win.10)).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletverb
 * @namespace Windows.ApplicationModel.Wallet
 * @version WindowsRuntime 1.4
 */
class WalletVerb extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWalletVerb

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWalletVerb.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Initializes a new instance of the [WalletVerb](walletverb.md) class.
     * @param {HSTRING} name The name of the custom verb. Sets the value of the [Name](walletverb_name.md) property.
     * @returns {WalletVerb} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletverb.#ctor
     */
    static CreateWalletVerb(name) {
        if (!WalletVerb.HasProp("__IWalletVerbFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Wallet.WalletVerb")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWalletVerbFactory.IID)
            WalletVerb.__IWalletVerbFactory := IWalletVerbFactory(factoryPtr)
        }

        return WalletVerb.__IWalletVerbFactory.CreateWalletVerb(name)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the custom verb name.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletverb.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
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
    get_Name() {
        if (!this.HasProp("__IWalletVerb")) {
            if ((queryResult := this.QueryInterface(IWalletVerb.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletVerb := IWalletVerb(outPtr)
        }

        return this.__IWalletVerb.get_Name()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if (!this.HasProp("__IWalletVerb")) {
            if ((queryResult := this.QueryInterface(IWalletVerb.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletVerb := IWalletVerb(outPtr)
        }

        return this.__IWalletVerb.put_Name(value)
    }

;@endregion Instance Methods
}
