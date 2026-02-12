#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnInterfaceId.ahk
#Include .\IVpnInterfaceIdFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an interface ID used in the construction and assignment of an IPv6 address to the VPN interface. The ID contained in this class fills the interface ID portion of the IPv6 address.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpninterfaceid
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnInterfaceId extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnInterfaceId

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnInterfaceId.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Integer} address_length 
     * @param {Pointer<Integer>} address 
     * @returns {VpnInterfaceId} 
     */
    static CreateVpnInterfaceId(address_length, address) {
        if (!VpnInterfaceId.HasProp("__IVpnInterfaceIdFactory")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Vpn.VpnInterfaceId")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVpnInterfaceIdFactory.IID)
            VpnInterfaceId.__IVpnInterfaceIdFactory := IVpnInterfaceIdFactory(factoryPtr)
        }

        return VpnInterfaceId.__IVpnInterfaceIdFactory.CreateVpnInterfaceId(address_length, address)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets the address represented as the set of bytes to be used as the interface ID.
     * @param {Pointer<Byte>} id The address represented as the set of bytes.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpninterfaceid.getaddressinfo
     */
    GetAddressInfo(id) {
        if (!this.HasProp("__IVpnInterfaceId")) {
            if ((queryResult := this.QueryInterface(IVpnInterfaceId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnInterfaceId := IVpnInterfaceId(outPtr)
        }

        return this.__IVpnInterfaceId.GetAddressInfo(id)
    }

;@endregion Instance Methods
}
