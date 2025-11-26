#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\INetFwOpenPorts.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetFwService interface provides access to the properties of a service that may be authorized to listen through the firewall.
 * @remarks
 * 
 * Instances of this interface are retrieved
 * through the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwservices">INetFwServices</a> collection. 
 * 
 * All configuration changes take
 * effect immediately.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//netfw/nn-netfw-inetfwservice
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwService extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetFwService
     * @type {Guid}
     */
    static IID => Guid("{79fd57c8-908e-4a36-9888-d5b3f0a444cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Type", "get_Customized", "get_IpVersion", "put_IpVersion", "get_Scope", "put_Scope", "get_RemoteAddresses", "put_RemoteAddresses", "get_Enabled", "put_Enabled", "get_GloballyOpenPorts"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {Integer} 
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
     * @type {Integer} 
     */
    IpVersion {
        get => this.get_IpVersion()
        set => this.put_IpVersion(value)
    }

    /**
     * @type {Integer} 
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
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwservice-get_name
     */
    get_Name() {
        name := BSTR()
        result := ComCall(7, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * Retrieves the type of the service.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwservice-get_type
     */
    get_Type() {
        result := ComCall(8, this, "int*", &type := 0, "HRESULT")
        return type
    }

    /**
     * Indicates whether at least one of the ports associated with the service has been customized.
     * @remarks
     * 
     * If a service has been customized, the values
     *    returned by the service properties do not reflect the configuration of
     *    all the ports associated with the service.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwservice-get_customized
     */
    get_Customized() {
        result := ComCall(9, this, "short*", &customized := 0, "HRESULT")
        return customized
    }

    /**
     * Specifies the firewall IP version for which the service is authorized.
     * @remarks
     * 
     * Only
     *    <b>NET_FW_IP_VERSION_ANY</b> is supported.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwservice-get_ipversion
     */
    get_IpVersion() {
        result := ComCall(10, this, "int*", &ipVersion := 0, "HRESULT")
        return ipVersion
    }

    /**
     * Specifies the firewall IP version for which the service is authorized.
     * @remarks
     * 
     * Only
     *    <b>NET_FW_IP_VERSION_ANY</b> is supported.
     * 
     * 
     * @param {Integer} ipVersion 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwservice-put_ipversion
     */
    put_IpVersion(ipVersion) {
        result := ComCall(11, this, "int", ipVersion, "HRESULT")
        return result
    }

    /**
     * Controls the network scope from which the port can listen.
     * @remarks
     * 
     * When setting the
     *    Scope property, only <b>NET_FW_SCOPE_ALL</b> and <b>NET_FW_SCOPE_LOCAL_SUBNET</b> are valid.
     *    
     * 
     * The default value is
     *    <b>NET_FW_SCOPE_ALL</b> for new ports.
     * 
     * To create a custom scope, use the <a href="https://docs.microsoft.com/windows/desktop/api/netfw/nf-netfw-inetfwservice-get_remoteaddresses">RemoteAddresses</a> property.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwservice-get_scope
     */
    get_Scope() {
        result := ComCall(12, this, "int*", &scope := 0, "HRESULT")
        return scope
    }

    /**
     * Controls the network scope from which the port can listen.
     * @remarks
     * 
     * When setting the
     *    Scope property, only <b>NET_FW_SCOPE_ALL</b> and <b>NET_FW_SCOPE_LOCAL_SUBNET</b> are valid.
     *    
     * 
     * The default value is
     *    <b>NET_FW_SCOPE_ALL</b> for new ports.
     * 
     * To create a custom scope, use the <a href="https://docs.microsoft.com/windows/desktop/api/netfw/nf-netfw-inetfwservice-get_remoteaddresses">RemoteAddresses</a> property.
     * 
     * 
     * @param {Integer} scope 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwservice-put_scope
     */
    put_Scope(scope) {
        result := ComCall(13, this, "int", scope, "HRESULT")
        return result
    }

    /**
     * Specifies a set of the remote addresses from which the service ports can listen for traffic.
     * @remarks
     * 
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
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwservice-get_remoteaddresses
     */
    get_RemoteAddresses() {
        remoteAddrs := BSTR()
        result := ComCall(14, this, "ptr", remoteAddrs, "HRESULT")
        return remoteAddrs
    }

    /**
     * Specifies a set of the remote addresses from which the service ports can listen for traffic.
     * @remarks
     * 
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
     * 
     * 
     * @param {BSTR} remoteAddrs 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwservice-put_remoteaddresses
     */
    put_RemoteAddresses(remoteAddrs) {
        remoteAddrs := remoteAddrs is String ? BSTR.Alloc(remoteAddrs).Value : remoteAddrs

        result := ComCall(15, this, "ptr", remoteAddrs, "HRESULT")
        return result
    }

    /**
     * Indicates whether all the ports associated with the service are enabled.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwservice-get_enabled
     */
    get_Enabled() {
        result := ComCall(16, this, "short*", &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * Indicates whether all the ports associated with the service are enabled.
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwservice-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(17, this, "short", enabled, "HRESULT")
        return result
    }

    /**
     * Retrieves the collection of globally open ports associated with the service.
     * @returns {INetFwOpenPorts} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwservice-get_globallyopenports
     */
    get_GloballyOpenPorts() {
        result := ComCall(18, this, "ptr*", &openPorts := 0, "HRESULT")
        return INetFwOpenPorts(openPorts)
    }
}
