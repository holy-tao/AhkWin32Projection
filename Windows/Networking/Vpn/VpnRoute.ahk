#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnRoute.ahk
#Include .\IVpnRouteFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a route relative to the VPN channel. It is composed of an address and a prefix size to identify the subnet being routed. The route can then be either included or excluded from the VPN channel scope.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnroute
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnRoute extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnRoute

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnRoute.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Constructs a [VpnRoute](vpnroute.md) object.
     * @param {HostName} address_ The ID or the address of the subnet under the route control.
     * @param {Integer} prefixSize The size (in bits) to be considered by the subnet.
     * @returns {VpnRoute} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnroute.#ctor
     */
    static CreateVpnRoute(address_, prefixSize) {
        if (!VpnRoute.HasProp("__IVpnRouteFactory")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Vpn.VpnRoute")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVpnRouteFactory.IID)
            VpnRoute.__IVpnRouteFactory := IVpnRouteFactory(factoryPtr)
        }

        return VpnRoute.__IVpnRouteFactory.CreateVpnRoute(address_, prefixSize)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the ID or the address of the subnet under the route control.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnroute.address
     * @type {HostName} 
     */
    Address {
        get => this.get_Address()
        set => this.put_Address(value)
    }

    /**
     * Gets or sets the size (in bits) to be considered by the subnet..
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnroute.prefixsize
     * @type {Integer} 
     */
    PrefixSize {
        get => this.get_PrefixSize()
        set => this.put_PrefixSize(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {HostName} value 
     * @returns {HRESULT} 
     */
    put_Address(value) {
        if (!this.HasProp("__IVpnRoute")) {
            if ((queryResult := this.QueryInterface(IVpnRoute.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnRoute := IVpnRoute(outPtr)
        }

        return this.__IVpnRoute.put_Address(value)
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_Address() {
        if (!this.HasProp("__IVpnRoute")) {
            if ((queryResult := this.QueryInterface(IVpnRoute.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnRoute := IVpnRoute(outPtr)
        }

        return this.__IVpnRoute.get_Address()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PrefixSize(value) {
        if (!this.HasProp("__IVpnRoute")) {
            if ((queryResult := this.QueryInterface(IVpnRoute.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnRoute := IVpnRoute(outPtr)
        }

        return this.__IVpnRoute.put_PrefixSize(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrefixSize() {
        if (!this.HasProp("__IVpnRoute")) {
            if ((queryResult := this.QueryInterface(IVpnRoute.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnRoute := IVpnRoute(outPtr)
        }

        return this.__IVpnRoute.get_PrefixSize()
    }

;@endregion Instance Methods
}
