#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\VpnAppId.ahk
#Include .\VpnRoute.ahk
#Include .\VpnDomainNameInfo.ahk
#Include .\VpnTrafficFilter.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes the **VpnProfile** base object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpnprofile
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnProfile extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnProfile
     * @type {Guid}
     */
    static IID => Guid("{7875b751-b0d7-43db-8a93-d3fe2479e56a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProfileName", "put_ProfileName", "get_AppTriggers", "get_Routes", "get_DomainNameInfoList", "get_TrafficFilters", "get_RememberCredentials", "put_RememberCredentials", "get_AlwaysOn", "put_AlwaysOn"]

    /**
     * Gets or sets the name of the VPN profile.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpnprofile.profilename
     * @type {HSTRING} 
     */
    ProfileName {
        get => this.get_ProfileName()
        set => this.put_ProfileName(value)
    }

    /**
     * Gets a list of apps that will trigger the VPN connection to connect.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpnprofile.apptriggers
     * @type {IVector<VpnAppId>} 
     */
    AppTriggers {
        get => this.get_AppTriggers()
    }

    /**
     * Gets a list of routes that must go over the VPN interface in the case of a Split Tunneled VPN.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpnprofile.routes
     * @type {IVector<VpnRoute>} 
     */
    Routes {
        get => this.get_Routes()
    }

    /**
     * Gets a list of Name Resolution Policy Table (NRPT) rules for the VPN plug-in profile.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpnprofile.domainnameinfolist
     * @type {IVector<VpnDomainNameInfo>} 
     */
    DomainNameInfoList {
        get => this.get_DomainNameInfoList()
    }

    /**
     * Gets a list of Traffic Filters (including per App) included in the VPN profile.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpnprofile.trafficfilters
     * @type {IVector<VpnTrafficFilter>} 
     */
    TrafficFilters {
        get => this.get_TrafficFilters()
    }

    /**
     * Gets or sets whether the credentials for the VPN profile will be cached. If TRUE, the credentials for the VPN profile will be cached where applicable.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpnprofile.remembercredentials
     * @type {Boolean} 
     */
    RememberCredentials {
        get => this.get_RememberCredentials()
        set => this.put_RememberCredentials(value)
    }

    /**
     * Gets or sets the AlwayOn property. If true, indicates that the VPN profile is always connected.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpnprofile.alwayson
     * @type {Boolean} 
     */
    AlwaysOn {
        get => this.get_AlwaysOn()
        set => this.put_AlwaysOn(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProfileName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ProfileName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<VpnAppId>} 
     */
    get_AppTriggers() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(VpnAppId, value)
    }

    /**
     * 
     * @returns {IVector<VpnRoute>} 
     */
    get_Routes() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(VpnRoute, value)
    }

    /**
     * 
     * @returns {IVector<VpnDomainNameInfo>} 
     */
    get_DomainNameInfoList() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(VpnDomainNameInfo, value)
    }

    /**
     * 
     * @returns {IVector<VpnTrafficFilter>} 
     */
    get_TrafficFilters() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(VpnTrafficFilter, value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RememberCredentials() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RememberCredentials(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AlwaysOn() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AlwaysOn(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
