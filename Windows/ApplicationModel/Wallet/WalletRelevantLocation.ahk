#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWalletRelevantLocation.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!CAUTION]
  * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
  * 
  * Represents relevant location data for a wallet item. A WalletRelevantLocation object represents the individual items for the [WalletItem.RelevantLocations](walletitem_relevantlocations.md) property.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletrelevantlocation
 * @namespace Windows.ApplicationModel.Wallet
 * @version WindowsRuntime 1.4
 */
class WalletRelevantLocation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWalletRelevantLocation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWalletRelevantLocation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the basic geographic position information of the location.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletrelevantlocation.position
     * @type {BasicGeoposition} 
     */
    Position {
        get => this.get_Position()
        set => this.put_Position(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the message associated with a relevant location.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletrelevantlocation.displaymessage
     * @type {HSTRING} 
     */
    DisplayMessage {
        get => this.get_DisplayMessage()
        set => this.put_DisplayMessage(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Initializes a new instance of the [WalletRelevantLocation](walletrelevantlocation.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Wallet.WalletRelevantLocation")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {BasicGeoposition} 
     */
    get_Position() {
        if (!this.HasProp("__IWalletRelevantLocation")) {
            if ((queryResult := this.QueryInterface(IWalletRelevantLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletRelevantLocation := IWalletRelevantLocation(outPtr)
        }

        return this.__IWalletRelevantLocation.get_Position()
    }

    /**
     * 
     * @param {BasicGeoposition} value 
     * @returns {HRESULT} 
     */
    put_Position(value) {
        if (!this.HasProp("__IWalletRelevantLocation")) {
            if ((queryResult := this.QueryInterface(IWalletRelevantLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletRelevantLocation := IWalletRelevantLocation(outPtr)
        }

        return this.__IWalletRelevantLocation.put_Position(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayMessage() {
        if (!this.HasProp("__IWalletRelevantLocation")) {
            if ((queryResult := this.QueryInterface(IWalletRelevantLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletRelevantLocation := IWalletRelevantLocation(outPtr)
        }

        return this.__IWalletRelevantLocation.get_DisplayMessage()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayMessage(value) {
        if (!this.HasProp("__IWalletRelevantLocation")) {
            if ((queryResult := this.QueryInterface(IWalletRelevantLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletRelevantLocation := IWalletRelevantLocation(outPtr)
        }

        return this.__IWalletRelevantLocation.put_DisplayMessage(value)
    }

;@endregion Instance Methods
}
