#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnRouteAssignment.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the list of routes assigned to the VPN channel for the correct flow and redirection of traffic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnrouteassignment
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnRouteAssignment extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnRouteAssignment

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnRouteAssignment.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a list of IPv4 routes that should send traffic over the VPN interface.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnrouteassignment.ipv4inclusionroutes
     * @type {IVector<VpnRoute>} 
     */
    Ipv4InclusionRoutes {
        get => this.get_Ipv4InclusionRoutes()
        set => this.put_Ipv4InclusionRoutes(value)
    }

    /**
     * Gets or sets a list of IPv6 routes that should always sent traffic over the VPN interface.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnrouteassignment.ipv6inclusionroutes
     * @type {IVector<VpnRoute>} 
     */
    Ipv6InclusionRoutes {
        get => this.get_Ipv6InclusionRoutes()
        set => this.put_Ipv6InclusionRoutes(value)
    }

    /**
     * Gets or sets a list of IPv4 routes that should not sent traffic over the VPN interface.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnrouteassignment.ipv4exclusionroutes
     * @type {IVector<VpnRoute>} 
     */
    Ipv4ExclusionRoutes {
        get => this.get_Ipv4ExclusionRoutes()
        set => this.put_Ipv4ExclusionRoutes(value)
    }

    /**
     * Gets or sets a list of IPv6 routes that should not sent traffic over the VPN interface.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnrouteassignment.ipv6exclusionroutes
     * @type {IVector<VpnRoute>} 
     */
    Ipv6ExclusionRoutes {
        get => this.get_Ipv6ExclusionRoutes()
        set => this.put_Ipv6ExclusionRoutes(value)
    }

    /**
     * Gets or sets whether the physical infrastructure network, such as the local subnet, should always be exempted from flowing over the VPN interface.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnrouteassignment.excludelocalsubnets
     * @type {Boolean} 
     */
    ExcludeLocalSubnets {
        get => this.get_ExcludeLocalSubnets()
        set => this.put_ExcludeLocalSubnets(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Allows a VPN plug-in to create the set of routing traffic policy to be set on a VPN channel.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.Vpn.VpnRouteAssignment")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {IVector<VpnRoute>} value 
     * @returns {HRESULT} 
     */
    put_Ipv4InclusionRoutes(value) {
        if (!this.HasProp("__IVpnRouteAssignment")) {
            if ((queryResult := this.QueryInterface(IVpnRouteAssignment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnRouteAssignment := IVpnRouteAssignment(outPtr)
        }

        return this.__IVpnRouteAssignment.put_Ipv4InclusionRoutes(value)
    }

    /**
     * 
     * @param {IVector<VpnRoute>} value 
     * @returns {HRESULT} 
     */
    put_Ipv6InclusionRoutes(value) {
        if (!this.HasProp("__IVpnRouteAssignment")) {
            if ((queryResult := this.QueryInterface(IVpnRouteAssignment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnRouteAssignment := IVpnRouteAssignment(outPtr)
        }

        return this.__IVpnRouteAssignment.put_Ipv6InclusionRoutes(value)
    }

    /**
     * 
     * @returns {IVector<VpnRoute>} 
     */
    get_Ipv4InclusionRoutes() {
        if (!this.HasProp("__IVpnRouteAssignment")) {
            if ((queryResult := this.QueryInterface(IVpnRouteAssignment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnRouteAssignment := IVpnRouteAssignment(outPtr)
        }

        return this.__IVpnRouteAssignment.get_Ipv4InclusionRoutes()
    }

    /**
     * 
     * @returns {IVector<VpnRoute>} 
     */
    get_Ipv6InclusionRoutes() {
        if (!this.HasProp("__IVpnRouteAssignment")) {
            if ((queryResult := this.QueryInterface(IVpnRouteAssignment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnRouteAssignment := IVpnRouteAssignment(outPtr)
        }

        return this.__IVpnRouteAssignment.get_Ipv6InclusionRoutes()
    }

    /**
     * 
     * @param {IVector<VpnRoute>} value 
     * @returns {HRESULT} 
     */
    put_Ipv4ExclusionRoutes(value) {
        if (!this.HasProp("__IVpnRouteAssignment")) {
            if ((queryResult := this.QueryInterface(IVpnRouteAssignment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnRouteAssignment := IVpnRouteAssignment(outPtr)
        }

        return this.__IVpnRouteAssignment.put_Ipv4ExclusionRoutes(value)
    }

    /**
     * 
     * @param {IVector<VpnRoute>} value 
     * @returns {HRESULT} 
     */
    put_Ipv6ExclusionRoutes(value) {
        if (!this.HasProp("__IVpnRouteAssignment")) {
            if ((queryResult := this.QueryInterface(IVpnRouteAssignment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnRouteAssignment := IVpnRouteAssignment(outPtr)
        }

        return this.__IVpnRouteAssignment.put_Ipv6ExclusionRoutes(value)
    }

    /**
     * 
     * @returns {IVector<VpnRoute>} 
     */
    get_Ipv4ExclusionRoutes() {
        if (!this.HasProp("__IVpnRouteAssignment")) {
            if ((queryResult := this.QueryInterface(IVpnRouteAssignment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnRouteAssignment := IVpnRouteAssignment(outPtr)
        }

        return this.__IVpnRouteAssignment.get_Ipv4ExclusionRoutes()
    }

    /**
     * 
     * @returns {IVector<VpnRoute>} 
     */
    get_Ipv6ExclusionRoutes() {
        if (!this.HasProp("__IVpnRouteAssignment")) {
            if ((queryResult := this.QueryInterface(IVpnRouteAssignment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnRouteAssignment := IVpnRouteAssignment(outPtr)
        }

        return this.__IVpnRouteAssignment.get_Ipv6ExclusionRoutes()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ExcludeLocalSubnets(value) {
        if (!this.HasProp("__IVpnRouteAssignment")) {
            if ((queryResult := this.QueryInterface(IVpnRouteAssignment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnRouteAssignment := IVpnRouteAssignment(outPtr)
        }

        return this.__IVpnRouteAssignment.put_ExcludeLocalSubnets(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ExcludeLocalSubnets() {
        if (!this.HasProp("__IVpnRouteAssignment")) {
            if ((queryResult := this.QueryInterface(IVpnRouteAssignment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnRouteAssignment := IVpnRouteAssignment(outPtr)
        }

        return this.__IVpnRouteAssignment.get_ExcludeLocalSubnets()
    }

;@endregion Instance Methods
}
