#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INetworkItem.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a connected network.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkitem
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class NetworkItem extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INetworkItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INetworkItem.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the network ID.
     * @remarks
     * This value can be used to retrieve the unique ID of a network if [NetworkTypes](networktypes.md) is `Private`.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkitem.networkid
     * @type {Guid} 
     */
    NetworkId {
        get => this.get_NetworkId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_NetworkId() {
        if (!this.HasProp("__INetworkItem")) {
            if ((queryResult := this.QueryInterface(INetworkItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkItem := INetworkItem(outPtr)
        }

        return this.__INetworkItem.get_NetworkId()
    }

    /**
     * Gets a [NetworkTypes](networktypes.md) value indicating the network type for a [NetworkItem](networkitem.md).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkitem.getnetworktypes
     */
    GetNetworkTypes() {
        if (!this.HasProp("__INetworkItem")) {
            if ((queryResult := this.QueryInterface(INetworkItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkItem := INetworkItem(outPtr)
        }

        return this.__INetworkItem.GetNetworkTypes()
    }

;@endregion Instance Methods
}
