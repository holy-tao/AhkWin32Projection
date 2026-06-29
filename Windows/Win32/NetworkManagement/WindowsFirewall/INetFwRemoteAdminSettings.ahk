#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NET_FW_SCOPE.ahk" { NET_FW_SCOPE }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\NET_FW_IP_VERSION.ahk" { NET_FW_IP_VERSION }

/**
 * The INetFwRemoteAdminSettings interface provides access to the settings that control remote administration.
 * @remarks
 * An
 * instance of this interface is retrieved through the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwprofile-get_remoteadminsettings">RemoteAdminSettings</a> property of the INetFwProfile interface. 
 * 
 * All configuration changes take
 *  effect immediately.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/nn-netfw-inetfwremoteadminsettings
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INetFwRemoteAdminSettings extends IDispatch {
    /**
     * The interface identifier for INetFwRemoteAdminSettings
     * @type {Guid}
     */
    static IID := Guid("{d4becddf-6f73-4a83-b832-9c66874cd20e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetFwRemoteAdminSettings interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_IpVersion       : IntPtr
        put_IpVersion       : IntPtr
        get_Scope           : IntPtr
        put_Scope           : IntPtr
        get_RemoteAddresses : IntPtr
        put_RemoteAddresses : IntPtr
        get_Enabled         : IntPtr
        put_Enabled         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetFwRemoteAdminSettings.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {NET_FW_IP_VERSION} 
     */
    IpVersion {
        get => this.get_IpVersion()
        set => this.put_IpVersion(value)
    }

    /**
     * @type {NET_FW_SCOPE} 
     */
    Scope {
        get => this.get_Scope()
        set => this.put_Scope(value)
    }

    /**
     * @type {BSTR} 
     */
    RemoteAddresses {
        get => this.get_RemoteAddresses()
        set => this.put_RemoteAddresses(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * Specifies the IP version. (INetFwRemoteAdminSettings.get_IpVersion)
     * @remarks
     * This is the IP version for which remote admin is authorized. 
     * 
     * Only
     *     <b>NET_FW_IP_VERSION_ANY</b> is supported.
     * @returns {NET_FW_IP_VERSION} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwremoteadminsettings-get_ipversion
     */
    get_IpVersion() {
        result := ComCall(7, this, "int*", &ipVersion := 0, "HRESULT")
        return ipVersion
    }

    /**
     * Specifies the IP version. (INetFwRemoteAdminSettings.put_IpVersion)
     * @remarks
     * This is the IP version for which remote admin is authorized. 
     * 
     * Only
     *     <b>NET_FW_IP_VERSION_ANY</b> is supported.
     * @param {NET_FW_IP_VERSION} ipVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwremoteadminsettings-put_ipversion
     */
    put_IpVersion(ipVersion) {
        result := ComCall(8, this, NET_FW_IP_VERSION, ipVersion, "HRESULT")
        return result
    }

    /**
     * Controls the network scope from which remote administration is allowed. (Get)
     * @remarks
     * When setting the
     *    <b>Scope</b> property, only <b>NET_FW_SCOPE_ALL</b> and <b>NET_FW_SCOPE_LOCAL_SUBNET</b> are valid.
     *    
     * 
     * The default value is
     *    <b>NET_FW_SCOPE_ALL</b> for new ports.
     * 
     * To create a custom scope, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwremoteadminsettings-get_remoteaddresses">RemoteAddresses</a> property of this interface.
     * @returns {NET_FW_SCOPE} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwremoteadminsettings-get_scope
     */
    get_Scope() {
        result := ComCall(9, this, "int*", &scope := 0, "HRESULT")
        return scope
    }

    /**
     * Controls the network scope from which remote administration is allowed. (Put)
     * @remarks
     * When setting the
     *    <b>Scope</b> property, only <b>NET_FW_SCOPE_ALL</b> and <b>NET_FW_SCOPE_LOCAL_SUBNET</b> are valid.
     *    
     * 
     * The default value is
     *    <b>NET_FW_SCOPE_ALL</b> for new ports.
     * 
     * To create a custom scope, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwremoteadminsettings-get_remoteaddresses">RemoteAddresses</a> property of this interface.
     * @param {NET_FW_SCOPE} scope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwremoteadminsettings-put_scope
     */
    put_Scope(scope) {
        result := ComCall(10, this, NET_FW_SCOPE, scope, "HRESULT")
        return result
    }

    /**
     * Specifies a set of remote addresses from which remote administration is allowed. (Get)
     * @remarks
     * The <i>remoteAddrs</i> parameter consists of one or more comma-delimited tokens specifying the remote addresses from which the application can listen for traffic. The default value is "*". 
     * 
     * Valid tokens:
     * 
     * 
     * <ul>
     * <li>"*": any remote address; if present, it must be the only token.</li>
     * <li>"LocalSubnet": not case-sensitive; specifying more than once has no effect.</li>
     * <li>subnet: may be specified using either subnet mask or network prefix notation. If neither a subnet mask nor a network prefix is specified, the subnet mask defaults to 255.255.255.255. Examples of valid subnets: 
     * 10.0.0.2/255.0.0.0 
     * 10.0.0.2/8 
     * 10.0.0.2</li>
     * <li>Windows Vista: A valid IPv6 address.</li>
     * <li>Windows Vista: An IPv4 address range in the format "start address - end address."</li>
     * <li>Windows Vista: An IPv6 address range in the format "start address - end address."</li>
     * </ul>
     * For a predefined address range, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwremoteadminsettings-get_scope">Scope</a> property.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwremoteadminsettings-get_remoteaddresses
     */
    get_RemoteAddresses() {
        remoteAddrs := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, remoteAddrs, "HRESULT")
        return remoteAddrs
    }

    /**
     * Specifies a set of remote addresses from which remote administration is allowed. (Put)
     * @remarks
     * The <i>remoteAddrs</i> parameter consists of one or more comma-delimited tokens specifying the remote addresses from which the application can listen for traffic. The default value is "*". 
     * 
     * Valid tokens:
     * 
     * 
     * <ul>
     * <li>"*": any remote address; if present, it must be the only token.</li>
     * <li>"LocalSubnet": not case-sensitive; specifying more than once has no effect.</li>
     * <li>subnet: may be specified using either subnet mask or network prefix notation. If neither a subnet mask nor a network prefix is specified, the subnet mask defaults to 255.255.255.255. Examples of valid subnets: 
     * 10.0.0.2/255.0.0.0 
     * 10.0.0.2/8 
     * 10.0.0.2</li>
     * <li>Windows Vista: A valid IPv6 address.</li>
     * <li>Windows Vista: An IPv4 address range in the format "start address - end address."</li>
     * <li>Windows Vista: An IPv6 address range in the format "start address - end address."</li>
     * </ul>
     * For a predefined address range, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwremoteadminsettings-get_scope">Scope</a> property.
     * @param {BSTR} remoteAddrs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwremoteadminsettings-put_remoteaddresses
     */
    put_RemoteAddresses(remoteAddrs) {
        remoteAddrs := remoteAddrs is String ? BSTR.Alloc(remoteAddrs).Value : remoteAddrs

        result := ComCall(12, this, BSTR, remoteAddrs, "HRESULT")
        return result
    }

    /**
     * Indicates whether remote administration is enabled.. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwremoteadminsettings-get_enabled
     */
    get_Enabled() {
        result := ComCall(13, this, VARIANT_BOOL.Ptr, &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * Indicates whether remote administration is enabled.. (Put)
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwremoteadminsettings-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(14, this, VARIANT_BOOL, enabled, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetFwRemoteAdminSettings.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_IpVersion := CallbackCreate(GetMethod(implObj, "get_IpVersion"), flags, 2)
        this.vtbl.put_IpVersion := CallbackCreate(GetMethod(implObj, "put_IpVersion"), flags, 2)
        this.vtbl.get_Scope := CallbackCreate(GetMethod(implObj, "get_Scope"), flags, 2)
        this.vtbl.put_Scope := CallbackCreate(GetMethod(implObj, "put_Scope"), flags, 2)
        this.vtbl.get_RemoteAddresses := CallbackCreate(GetMethod(implObj, "get_RemoteAddresses"), flags, 2)
        this.vtbl.put_RemoteAddresses := CallbackCreate(GetMethod(implObj, "put_RemoteAddresses"), flags, 2)
        this.vtbl.get_Enabled := CallbackCreate(GetMethod(implObj, "get_Enabled"), flags, 2)
        this.vtbl.put_Enabled := CallbackCreate(GetMethod(implObj, "put_Enabled"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_IpVersion)
        CallbackFree(this.vtbl.put_IpVersion)
        CallbackFree(this.vtbl.get_Scope)
        CallbackFree(this.vtbl.put_Scope)
        CallbackFree(this.vtbl.get_RemoteAddresses)
        CallbackFree(this.vtbl.put_RemoteAddresses)
        CallbackFree(this.vtbl.get_Enabled)
        CallbackFree(this.vtbl.put_Enabled)
    }
}
