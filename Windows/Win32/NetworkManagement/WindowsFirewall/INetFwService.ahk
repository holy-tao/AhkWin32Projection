#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NET_FW_SCOPE.ahk" { NET_FW_SCOPE }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\NET_FW_SERVICE_TYPE.ahk" { NET_FW_SERVICE_TYPE }
#Import ".\NET_FW_IP_VERSION.ahk" { NET_FW_IP_VERSION }
#Import ".\INetFwOpenPorts.ahk" { INetFwOpenPorts }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The INetFwService interface provides access to the properties of a service that may be authorized to listen through the firewall.
 * @remarks
 * Instances of this interface are retrieved
 * through the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwservices">INetFwServices</a> collection. 
 * 
 * All configuration changes take
 * effect immediately.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/nn-netfw-inetfwservice
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INetFwService extends IDispatch {
    /**
     * The interface identifier for INetFwService
     * @type {Guid}
     */
    static IID := Guid("{79fd57c8-908e-4a36-9888-d5b3f0a444cf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetFwService interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name              : IntPtr
        get_Type              : IntPtr
        get_Customized        : IntPtr
        get_IpVersion         : IntPtr
        put_IpVersion         : IntPtr
        get_Scope             : IntPtr
        put_Scope             : IntPtr
        get_RemoteAddresses   : IntPtr
        put_RemoteAddresses   : IntPtr
        get_Enabled           : IntPtr
        put_Enabled           : IntPtr
        get_GloballyOpenPorts : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetFwService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {NET_FW_SERVICE_TYPE} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Customized {
        get => this.get_Customized()
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
     * @type {INetFwOpenPorts} 
     */
    GloballyOpenPorts {
        get => this.get_GloballyOpenPorts()
    }

    /**
     * Retrieves the friendly name of the service.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-get_name
     */
    get_Name() {
        name := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * Retrieves the type of the service.
     * @returns {NET_FW_SERVICE_TYPE} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-get_type
     */
    get_Type() {
        result := ComCall(8, this, "int*", &type := 0, "HRESULT")
        return type
    }

    /**
     * Indicates whether at least one of the ports associated with the service has been customized.
     * @remarks
     * If a service has been customized, the values
     *    returned by the service properties do not reflect the configuration of
     *    all the ports associated with the service.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-get_customized
     */
    get_Customized() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &customized := 0, "HRESULT")
        return customized
    }

    /**
     * Specifies the firewall IP version for which the service is authorized. (Get)
     * @remarks
     * Only
     *    <b>NET_FW_IP_VERSION_ANY</b> is supported.
     * @returns {NET_FW_IP_VERSION} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-get_ipversion
     */
    get_IpVersion() {
        result := ComCall(10, this, "int*", &ipVersion := 0, "HRESULT")
        return ipVersion
    }

    /**
     * Specifies the firewall IP version for which the service is authorized. (Put)
     * @remarks
     * Only
     *    <b>NET_FW_IP_VERSION_ANY</b> is supported.
     * @param {NET_FW_IP_VERSION} ipVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-put_ipversion
     */
    put_IpVersion(ipVersion) {
        result := ComCall(11, this, NET_FW_IP_VERSION, ipVersion, "HRESULT")
        return result
    }

    /**
     * Controls the network scope from which the port can listen. (INetFwService.get_Scope)
     * @remarks
     * When setting the
     *    Scope property, only <b>NET_FW_SCOPE_ALL</b> and <b>NET_FW_SCOPE_LOCAL_SUBNET</b> are valid.
     *    
     * 
     * The default value is
     *    <b>NET_FW_SCOPE_ALL</b> for new ports.
     * 
     * To create a custom scope, use the <a href="https://docs.microsoft.com/windows/desktop/api/netfw/nf-netfw-inetfwservice-get_remoteaddresses">RemoteAddresses</a> property.
     * @returns {NET_FW_SCOPE} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-get_scope
     */
    get_Scope() {
        result := ComCall(12, this, "int*", &scope := 0, "HRESULT")
        return scope
    }

    /**
     * Controls the network scope from which the port can listen. (INetFwService.put_Scope)
     * @remarks
     * When setting the
     *    Scope property, only <b>NET_FW_SCOPE_ALL</b> and <b>NET_FW_SCOPE_LOCAL_SUBNET</b> are valid.
     *    
     * 
     * The default value is
     *    <b>NET_FW_SCOPE_ALL</b> for new ports.
     * 
     * To create a custom scope, use the <a href="https://docs.microsoft.com/windows/desktop/api/netfw/nf-netfw-inetfwservice-get_remoteaddresses">RemoteAddresses</a> property.
     * @param {NET_FW_SCOPE} scope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-put_scope
     */
    put_Scope(scope) {
        result := ComCall(13, this, NET_FW_SCOPE, scope, "HRESULT")
        return result
    }

    /**
     * Specifies a set of the remote addresses from which the service ports can listen for traffic. (Get)
     * @remarks
     * If
     *    the service has been customized, get returns the union of the remote
     *    addresses for all the service ports.
     * 
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
     * For a predefined address range, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwservice-get_scope">Scope</a> property.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-get_remoteaddresses
     */
    get_RemoteAddresses() {
        remoteAddrs := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, remoteAddrs, "HRESULT")
        return remoteAddrs
    }

    /**
     * Specifies a set of the remote addresses from which the service ports can listen for traffic. (Put)
     * @remarks
     * If
     *    the service has been customized, get returns the union of the remote
     *    addresses for all the service ports.
     * 
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
     * For a predefined address range, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwservice-get_scope">Scope</a> property.
     * @param {BSTR} remoteAddrs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-put_remoteaddresses
     */
    put_RemoteAddresses(remoteAddrs) {
        remoteAddrs := remoteAddrs is String ? BSTR.Alloc(remoteAddrs).Value : remoteAddrs

        result := ComCall(15, this, BSTR, remoteAddrs, "HRESULT")
        return result
    }

    /**
     * Indicates whether all the ports associated with the service are enabled. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-get_enabled
     */
    get_Enabled() {
        result := ComCall(16, this, VARIANT_BOOL.Ptr, &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * Indicates whether all the ports associated with the service are enabled. (Put)
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(17, this, VARIANT_BOOL, enabled, "HRESULT")
        return result
    }

    /**
     * Retrieves the collection of globally open ports associated with the service.
     * @returns {INetFwOpenPorts} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-get_globallyopenports
     */
    get_GloballyOpenPorts() {
        result := ComCall(18, this, "ptr*", &openPorts := 0, "HRESULT")
        return INetFwOpenPorts(openPorts)
    }

    Query(iid) {
        if (INetFwService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.get_Customized := CallbackCreate(GetMethod(implObj, "get_Customized"), flags, 2)
        this.vtbl.get_IpVersion := CallbackCreate(GetMethod(implObj, "get_IpVersion"), flags, 2)
        this.vtbl.put_IpVersion := CallbackCreate(GetMethod(implObj, "put_IpVersion"), flags, 2)
        this.vtbl.get_Scope := CallbackCreate(GetMethod(implObj, "get_Scope"), flags, 2)
        this.vtbl.put_Scope := CallbackCreate(GetMethod(implObj, "put_Scope"), flags, 2)
        this.vtbl.get_RemoteAddresses := CallbackCreate(GetMethod(implObj, "get_RemoteAddresses"), flags, 2)
        this.vtbl.put_RemoteAddresses := CallbackCreate(GetMethod(implObj, "put_RemoteAddresses"), flags, 2)
        this.vtbl.get_Enabled := CallbackCreate(GetMethod(implObj, "get_Enabled"), flags, 2)
        this.vtbl.put_Enabled := CallbackCreate(GetMethod(implObj, "put_Enabled"), flags, 2)
        this.vtbl.get_GloballyOpenPorts := CallbackCreate(GetMethod(implObj, "get_GloballyOpenPorts"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.get_Customized)
        CallbackFree(this.vtbl.get_IpVersion)
        CallbackFree(this.vtbl.put_IpVersion)
        CallbackFree(this.vtbl.get_Scope)
        CallbackFree(this.vtbl.put_Scope)
        CallbackFree(this.vtbl.get_RemoteAddresses)
        CallbackFree(this.vtbl.put_RemoteAddresses)
        CallbackFree(this.vtbl.get_Enabled)
        CallbackFree(this.vtbl.put_Enabled)
        CallbackFree(this.vtbl.get_GloballyOpenPorts)
    }
}
