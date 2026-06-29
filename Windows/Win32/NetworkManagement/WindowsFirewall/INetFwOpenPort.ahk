#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\NET_FW_IP_PROTOCOL.ahk" { NET_FW_IP_PROTOCOL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NET_FW_SCOPE.ahk" { NET_FW_SCOPE }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\NET_FW_IP_VERSION.ahk" { NET_FW_IP_VERSION }

/**
 * The INetFwOpenPort interface provides access to the properties of a port that has been opened in the firewall.
 * @remarks
 * Ports  with their <b>BuiltIn</b> property set to true (<b>VARIANT_TRUE</b>) are system specified and cannot be removed.
 * 
 * When creating new ports, this interface is supported by the
 * <b>HNetCfg.FWOpenPort</b> COM object. 
 * 
 * For reading or modifying existing ports,
 * instances of this interface are retrieved through the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwopenports">INetFwOpenPorts</a> collection. 
 * 
 * All configuration changes take effect immediately.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/nn-netfw-inetfwopenport
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INetFwOpenPort extends IDispatch {
    /**
     * The interface identifier for INetFwOpenPort
     * @type {Guid}
     */
    static IID := Guid("{e0483ba0-47ff-4d9c-a6d6-7741d0b195f7}")

    /**
     * The class identifier for NetFwOpenPort
     * @type {Guid}
     */
    static CLSID := Guid("{0ca545c6-37ad-4a6c-bf92-9f7610067ef5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetFwOpenPort interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name            : IntPtr
        put_Name            : IntPtr
        get_IpVersion       : IntPtr
        put_IpVersion       : IntPtr
        get_Protocol        : IntPtr
        put_Protocol        : IntPtr
        get_Port            : IntPtr
        put_Port            : IntPtr
        get_Scope           : IntPtr
        put_Scope           : IntPtr
        get_RemoteAddresses : IntPtr
        put_RemoteAddresses : IntPtr
        get_Enabled         : IntPtr
        put_Enabled         : IntPtr
        get_BuiltIn         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetFwOpenPort.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {NET_FW_IP_VERSION} 
     */
    IpVersion {
        get => this.get_IpVersion()
        set => this.put_IpVersion(value)
    }

    /**
     * @type {NET_FW_IP_PROTOCOL} 
     */
    Protocol {
        get => this.get_Protocol()
        set => this.put_Protocol(value)
    }

    /**
     * @type {Integer} 
     */
    Port {
        get => this.get_Port()
        set => this.put_Port(value)
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
     * @type {VARIANT_BOOL} 
     */
    BuiltIn {
        get => this.get_BuiltIn()
    }

    /**
     * Specifies the friendly name of this port. (Get)
     * @remarks
     * This property is required.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-get_name
     */
    get_Name() {
        name := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * Specifies the friendly name of this port. (Put)
     * @remarks
     * This property is required.
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, BSTR, name, "HRESULT")
        return result
    }

    /**
     * Specifies the IP version setting for this port. (Get)
     * @remarks
     * Only <b>NET_FW_IP_VERSION_ANY</b> is supported and this is the default for new ports.
     * @returns {NET_FW_IP_VERSION} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-get_ipversion
     */
    get_IpVersion() {
        result := ComCall(9, this, "int*", &ipVersion := 0, "HRESULT")
        return ipVersion
    }

    /**
     * Specifies the IP version setting for this port. (Put)
     * @remarks
     * Only <b>NET_FW_IP_VERSION_ANY</b> is supported and this is the default for new ports.
     * @param {NET_FW_IP_VERSION} ipVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-put_ipversion
     */
    put_IpVersion(ipVersion) {
        result := ComCall(10, this, NET_FW_IP_VERSION, ipVersion, "HRESULT")
        return result
    }

    /**
     * Specifies the protocol type setting for this port. (Get)
     * @remarks
     * The default protocol type is TCP for new ports.
     * @returns {NET_FW_IP_PROTOCOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-get_protocol
     */
    get_Protocol() {
        result := ComCall(11, this, "int*", &ipProtocol := 0, "HRESULT")
        return ipProtocol
    }

    /**
     * Specifies the protocol type setting for this port. (Put)
     * @remarks
     * The default protocol type is TCP for new ports.
     * @param {NET_FW_IP_PROTOCOL} ipProtocol 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-put_protocol
     */
    put_Protocol(ipProtocol) {
        result := ComCall(12, this, NET_FW_IP_PROTOCOL, ipProtocol, "HRESULT")
        return result
    }

    /**
     * Specifies the host-ordered port number for this port. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-get_port
     */
    get_Port() {
        result := ComCall(13, this, "int*", &portNumber := 0, "HRESULT")
        return portNumber
    }

    /**
     * Specifies the host-ordered port number for this port. (Put)
     * @param {Integer} portNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-put_port
     */
    put_Port(portNumber) {
        result := ComCall(14, this, "int", portNumber, "HRESULT")
        return result
    }

    /**
     * Controls the network scope from which the port can listen. (INetFwOpenPort.get_Scope)
     * @remarks
     * When setting the
     *    Scope property, only <b>NET_FW_SCOPE_ALL</b> and <b>NET_FW_SCOPE_LOCAL_SUBNET</b> are valid.
     * 
     * The default value is
     *    <b>NET_FW_SCOPE_ALL</b> for new ports.
     * 
     * To create a custom scope, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwopenport-get_remoteaddresses">RemoteAddresses</a> property.
     * @returns {NET_FW_SCOPE} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-get_scope
     */
    get_Scope() {
        result := ComCall(15, this, "int*", &scope := 0, "HRESULT")
        return scope
    }

    /**
     * Controls the network scope from which the port can listen. (INetFwOpenPort.put_Scope)
     * @remarks
     * When setting the
     *    Scope property, only <b>NET_FW_SCOPE_ALL</b> and <b>NET_FW_SCOPE_LOCAL_SUBNET</b> are valid.
     * 
     * The default value is
     *    <b>NET_FW_SCOPE_ALL</b> for new ports.
     * 
     * To create a custom scope, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwopenport-get_remoteaddresses">RemoteAddresses</a> property.
     * @param {NET_FW_SCOPE} scope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-put_scope
     */
    put_Scope(scope) {
        result := ComCall(16, this, NET_FW_SCOPE, scope, "HRESULT")
        return result
    }

    /**
     * Specifies a set of remote addresses from which the port can listen for traffic. (Get)
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
     * For a predefined address range, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwopenport-get_scope">Scope</a> property.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-get_remoteaddresses
     */
    get_RemoteAddresses() {
        remoteAddrs := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, remoteAddrs, "HRESULT")
        return remoteAddrs
    }

    /**
     * Specifies a set of remote addresses from which the port can listen for traffic. (Put)
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
     * For a predefined address range, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwopenport-get_scope">Scope</a> property.
     * @param {BSTR} remoteAddrs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-put_remoteaddresses
     */
    put_RemoteAddresses(remoteAddrs) {
        remoteAddrs := remoteAddrs is String ? BSTR.Alloc(remoteAddrs).Value : remoteAddrs

        result := ComCall(18, this, BSTR, remoteAddrs, "HRESULT")
        return result
    }

    /**
     * Indicates whether the settings for this port are currently enabled. (Get)
     * @remarks
     * This property can be set to false (<b>VARIANT_FALSE</b>) to allow port settings to be stored in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwopenports">INetFWOpenPorts</a> collection without actually opening the port. 
     * 
     * The default value is true (<b>VARIANT_TRUE</b>) for new ports.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-get_enabled
     */
    get_Enabled() {
        result := ComCall(19, this, VARIANT_BOOL.Ptr, &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * Indicates whether the settings for this port are currently enabled. (Put)
     * @remarks
     * This property can be set to false (<b>VARIANT_FALSE</b>) to allow port settings to be stored in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwopenports">INetFWOpenPorts</a> collection without actually opening the port. 
     * 
     * The default value is true (<b>VARIANT_TRUE</b>) for new ports.
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(20, this, VARIANT_BOOL, enabled, "HRESULT")
        return result
    }

    /**
     * Indicates whether the port is defined by the system.
     * @remarks
     * Ports  with their <b>BuiltIn</b> property set to true (<b>VARIANT_TRUE</b>) are system specified and cannot be removed, only the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwopenport-get_enabled">Enabled</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwopenport-get_remoteaddresses">RemoteAddress</a>, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwopenport-get_scope">Scope</a> properties can be modified.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-get_builtin
     */
    get_BuiltIn() {
        result := ComCall(21, this, VARIANT_BOOL.Ptr, &builtIn := 0, "HRESULT")
        return builtIn
    }

    Query(iid) {
        if (INetFwOpenPort.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
        this.vtbl.get_IpVersion := CallbackCreate(GetMethod(implObj, "get_IpVersion"), flags, 2)
        this.vtbl.put_IpVersion := CallbackCreate(GetMethod(implObj, "put_IpVersion"), flags, 2)
        this.vtbl.get_Protocol := CallbackCreate(GetMethod(implObj, "get_Protocol"), flags, 2)
        this.vtbl.put_Protocol := CallbackCreate(GetMethod(implObj, "put_Protocol"), flags, 2)
        this.vtbl.get_Port := CallbackCreate(GetMethod(implObj, "get_Port"), flags, 2)
        this.vtbl.put_Port := CallbackCreate(GetMethod(implObj, "put_Port"), flags, 2)
        this.vtbl.get_Scope := CallbackCreate(GetMethod(implObj, "get_Scope"), flags, 2)
        this.vtbl.put_Scope := CallbackCreate(GetMethod(implObj, "put_Scope"), flags, 2)
        this.vtbl.get_RemoteAddresses := CallbackCreate(GetMethod(implObj, "get_RemoteAddresses"), flags, 2)
        this.vtbl.put_RemoteAddresses := CallbackCreate(GetMethod(implObj, "put_RemoteAddresses"), flags, 2)
        this.vtbl.get_Enabled := CallbackCreate(GetMethod(implObj, "get_Enabled"), flags, 2)
        this.vtbl.put_Enabled := CallbackCreate(GetMethod(implObj, "put_Enabled"), flags, 2)
        this.vtbl.get_BuiltIn := CallbackCreate(GetMethod(implObj, "get_BuiltIn"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Name)
        CallbackFree(this.vtbl.get_IpVersion)
        CallbackFree(this.vtbl.put_IpVersion)
        CallbackFree(this.vtbl.get_Protocol)
        CallbackFree(this.vtbl.put_Protocol)
        CallbackFree(this.vtbl.get_Port)
        CallbackFree(this.vtbl.put_Port)
        CallbackFree(this.vtbl.get_Scope)
        CallbackFree(this.vtbl.put_Scope)
        CallbackFree(this.vtbl.get_RemoteAddresses)
        CallbackFree(this.vtbl.put_RemoteAddresses)
        CallbackFree(this.vtbl.get_Enabled)
        CallbackFree(this.vtbl.put_Enabled)
        CallbackFree(this.vtbl.get_BuiltIn)
    }
}
