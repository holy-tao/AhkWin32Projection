#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnTrafficFilterAssignment.ahk
#Include ..\..\..\Guid.ahk

/**
 * Allows the specification of a set of traffic filters as policy to a VPN channel.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpntrafficfilterassignment
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnTrafficFilterAssignment extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnTrafficFilterAssignment

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnTrafficFilterAssignment.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a list of traffic filters composing the traffic filter policy to assign to a VPN channel.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpntrafficfilterassignment.trafficfilterlist
     * @type {IVector<VpnTrafficFilter>} 
     */
    TrafficFilterList {
        get => this.get_TrafficFilterList()
    }

    /**
     * Gets or sets whether outbound traffic is allowed or not.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpntrafficfilterassignment.allowoutbound
     * @type {Boolean} 
     */
    AllowOutbound {
        get => this.get_AllowOutbound()
        set => this.put_AllowOutbound(value)
    }

    /**
     * Gets or sets whether inbound traffic is allowed or not.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpntrafficfilterassignment.allowinbound
     * @type {Boolean} 
     */
    AllowInbound {
        get => this.get_AllowInbound()
        set => this.put_AllowInbound(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Allows a VPN plug-in to create a traffic filter policy assignment for the VPN channel.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.Vpn.VpnTrafficFilterAssignment")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<VpnTrafficFilter>} 
     */
    get_TrafficFilterList() {
        if (!this.HasProp("__IVpnTrafficFilterAssignment")) {
            if ((queryResult := this.QueryInterface(IVpnTrafficFilterAssignment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnTrafficFilterAssignment := IVpnTrafficFilterAssignment(outPtr)
        }

        return this.__IVpnTrafficFilterAssignment.get_TrafficFilterList()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowOutbound() {
        if (!this.HasProp("__IVpnTrafficFilterAssignment")) {
            if ((queryResult := this.QueryInterface(IVpnTrafficFilterAssignment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnTrafficFilterAssignment := IVpnTrafficFilterAssignment(outPtr)
        }

        return this.__IVpnTrafficFilterAssignment.get_AllowOutbound()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowOutbound(value) {
        if (!this.HasProp("__IVpnTrafficFilterAssignment")) {
            if ((queryResult := this.QueryInterface(IVpnTrafficFilterAssignment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnTrafficFilterAssignment := IVpnTrafficFilterAssignment(outPtr)
        }

        return this.__IVpnTrafficFilterAssignment.put_AllowOutbound(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowInbound() {
        if (!this.HasProp("__IVpnTrafficFilterAssignment")) {
            if ((queryResult := this.QueryInterface(IVpnTrafficFilterAssignment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnTrafficFilterAssignment := IVpnTrafficFilterAssignment(outPtr)
        }

        return this.__IVpnTrafficFilterAssignment.get_AllowInbound()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowInbound(value) {
        if (!this.HasProp("__IVpnTrafficFilterAssignment")) {
            if ((queryResult := this.QueryInterface(IVpnTrafficFilterAssignment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnTrafficFilterAssignment := IVpnTrafficFilterAssignment(outPtr)
        }

        return this.__IVpnTrafficFilterAssignment.put_AllowInbound(value)
    }

;@endregion Instance Methods
}
