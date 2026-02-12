#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnTrafficFilter.ahk
#Include .\IVpnTrafficFilterFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Defines the traffic filtering properties (including per app VPN). A description of the type of network traffic that will be allowed over the VPN connection, such as a specific application and protocol allowed for the connection.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpntrafficfilter
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnTrafficFilter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnTrafficFilter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnTrafficFilter.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Allows a VPN plug-in or VPN management app to create a traffic filter.
     * @param {VpnAppId} appId The app ID associated with the new traffic filter.
     * @returns {VpnTrafficFilter} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpntrafficfilter.#ctor
     */
    static Create(appId) {
        if (!VpnTrafficFilter.HasProp("__IVpnTrafficFilterFactory")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Vpn.VpnTrafficFilter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVpnTrafficFilterFactory.IID)
            VpnTrafficFilter.__IVpnTrafficFilterFactory := IVpnTrafficFilterFactory(factoryPtr)
        }

        return VpnTrafficFilter.__IVpnTrafficFilterFactory.Create(appId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the ID of the app that is allowed by this traffic filter.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpntrafficfilter.appid
     * @type {VpnAppId} 
     */
    AppId {
        get => this.get_AppId()
        set => this.put_AppId(value)
    }

    /**
     * Gets a security descriptor specifying the set of checks of claims a process must have to be allowed by this traffic filter.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpntrafficfilter.appclaims
     * @type {IVector<HSTRING>} 
     */
    AppClaims {
        get => this.get_AppClaims()
    }

    /**
     * Gets or sets the IP protocol that is allowed by this traffic filter.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpntrafficfilter.protocol
     * @type {Integer} 
     */
    Protocol {
        get => this.get_Protocol()
        set => this.put_Protocol(value)
    }

    /**
     * Gets a list of the local port ranges that are allowed by this traffic filter. Specially useful for identifying SMB.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpntrafficfilter.localportranges
     * @type {IVector<HSTRING>} 
     */
    LocalPortRanges {
        get => this.get_LocalPortRanges()
    }

    /**
     * Gets a list of the remote port ranges that are allowed by this traffic filter.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpntrafficfilter.remoteportranges
     * @type {IVector<HSTRING>} 
     */
    RemotePortRanges {
        get => this.get_RemotePortRanges()
    }

    /**
     * Gets a list of the local address ranges that are allowed by this traffic filter.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpntrafficfilter.localaddressranges
     * @type {IVector<HSTRING>} 
     */
    LocalAddressRanges {
        get => this.get_LocalAddressRanges()
    }

    /**
     * Gets a list of the remote address ranges that are allowed by this traffic filter.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpntrafficfilter.remoteaddressranges
     * @type {IVector<HSTRING>} 
     */
    RemoteAddressRanges {
        get => this.get_RemoteAddressRanges()
    }

    /**
     * Gets or sets whether the apps allowed by this traffic filter are force tunneled through the VPN interface, or whether they are split tunneled and allowed to talk through other interfaces.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpntrafficfilter.routingpolicytype
     * @type {Integer} 
     */
    RoutingPolicyType {
        get => this.get_RoutingPolicyType()
        set => this.put_RoutingPolicyType(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {VpnAppId} 
     */
    get_AppId() {
        if (!this.HasProp("__IVpnTrafficFilter")) {
            if ((queryResult := this.QueryInterface(IVpnTrafficFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnTrafficFilter := IVpnTrafficFilter(outPtr)
        }

        return this.__IVpnTrafficFilter.get_AppId()
    }

    /**
     * 
     * @param {VpnAppId} value 
     * @returns {HRESULT} 
     */
    put_AppId(value) {
        if (!this.HasProp("__IVpnTrafficFilter")) {
            if ((queryResult := this.QueryInterface(IVpnTrafficFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnTrafficFilter := IVpnTrafficFilter(outPtr)
        }

        return this.__IVpnTrafficFilter.put_AppId(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_AppClaims() {
        if (!this.HasProp("__IVpnTrafficFilter")) {
            if ((queryResult := this.QueryInterface(IVpnTrafficFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnTrafficFilter := IVpnTrafficFilter(outPtr)
        }

        return this.__IVpnTrafficFilter.get_AppClaims()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Protocol() {
        if (!this.HasProp("__IVpnTrafficFilter")) {
            if ((queryResult := this.QueryInterface(IVpnTrafficFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnTrafficFilter := IVpnTrafficFilter(outPtr)
        }

        return this.__IVpnTrafficFilter.get_Protocol()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Protocol(value) {
        if (!this.HasProp("__IVpnTrafficFilter")) {
            if ((queryResult := this.QueryInterface(IVpnTrafficFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnTrafficFilter := IVpnTrafficFilter(outPtr)
        }

        return this.__IVpnTrafficFilter.put_Protocol(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_LocalPortRanges() {
        if (!this.HasProp("__IVpnTrafficFilter")) {
            if ((queryResult := this.QueryInterface(IVpnTrafficFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnTrafficFilter := IVpnTrafficFilter(outPtr)
        }

        return this.__IVpnTrafficFilter.get_LocalPortRanges()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_RemotePortRanges() {
        if (!this.HasProp("__IVpnTrafficFilter")) {
            if ((queryResult := this.QueryInterface(IVpnTrafficFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnTrafficFilter := IVpnTrafficFilter(outPtr)
        }

        return this.__IVpnTrafficFilter.get_RemotePortRanges()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_LocalAddressRanges() {
        if (!this.HasProp("__IVpnTrafficFilter")) {
            if ((queryResult := this.QueryInterface(IVpnTrafficFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnTrafficFilter := IVpnTrafficFilter(outPtr)
        }

        return this.__IVpnTrafficFilter.get_LocalAddressRanges()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_RemoteAddressRanges() {
        if (!this.HasProp("__IVpnTrafficFilter")) {
            if ((queryResult := this.QueryInterface(IVpnTrafficFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnTrafficFilter := IVpnTrafficFilter(outPtr)
        }

        return this.__IVpnTrafficFilter.get_RemoteAddressRanges()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RoutingPolicyType() {
        if (!this.HasProp("__IVpnTrafficFilter")) {
            if ((queryResult := this.QueryInterface(IVpnTrafficFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnTrafficFilter := IVpnTrafficFilter(outPtr)
        }

        return this.__IVpnTrafficFilter.get_RoutingPolicyType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RoutingPolicyType(value) {
        if (!this.HasProp("__IVpnTrafficFilter")) {
            if ((queryResult := this.QueryInterface(IVpnTrafficFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnTrafficFilter := IVpnTrafficFilter(outPtr)
        }

        return this.__IVpnTrafficFilter.put_RoutingPolicyType(value)
    }

;@endregion Instance Methods
}
