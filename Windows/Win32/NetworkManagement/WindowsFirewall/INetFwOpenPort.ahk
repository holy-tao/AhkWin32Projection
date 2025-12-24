#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetFwOpenPort interface provides access to the properties of a port that has been opened in the firewall.
 * @remarks
 * 
 * Ports  with their <b>BuiltIn</b> property set to true (<b>VARIANT_TRUE</b>) are system specified and cannot be removed.
 * 
 * When creating new ports, this interface is supported by the
 * <b>HNetCfg.FWOpenPort</b> COM object. 
 * 
 * For reading or modifying existing ports,
 * instances of this interface are retrieved through the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwopenports">INetFwOpenPorts</a>collection. 
 * 
 * All configuration changes take effect immediately.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//netfw/nn-netfw-inetfwopenport
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwOpenPort extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetFwOpenPort
     * @type {Guid}
     */
    static IID => Guid("{e0483ba0-47ff-4d9c-a6d6-7741d0b195f7}")

    /**
     * The class identifier for NetFwOpenPort
     * @type {Guid}
     */
    static CLSID => Guid("{0ca545c6-37ad-4a6c-bf92-9f7610067ef5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "put_Name", "get_IpVersion", "put_IpVersion", "get_Protocol", "put_Protocol", "get_Port", "put_Port", "get_Scope", "put_Scope", "get_RemoteAddresses", "put_RemoteAddresses", "get_Enabled", "put_Enabled", "get_BuiltIn"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
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
     * @type {VARIANT_BOOL} 
     */
    BuiltIn {
        get => this.get_BuiltIn()
    }

    /**
     * Specifies the friendly name of this port.
     * @remarks
     * 
     * This property is required.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwopenport-get_name
     */
    get_Name() {
        name := BSTR()
        result := ComCall(7, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * Specifies the friendly name of this port.
     * @remarks
     * 
     * This property is required.
     * 
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwopenport-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * Specifies the IP version setting for this port.
     * @remarks
     * 
     * Only <b>NET_FW_IP_VERSION_ANY</b> is supported and this is the default for new ports.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwopenport-get_ipversion
     */
    get_IpVersion() {
        result := ComCall(9, this, "int*", &ipVersion := 0, "HRESULT")
        return ipVersion
    }

    /**
     * Specifies the IP version setting for this port.
     * @remarks
     * 
     * Only <b>NET_FW_IP_VERSION_ANY</b> is supported and this is the default for new ports.
     * 
     * 
     * @param {Integer} ipVersion 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwopenport-put_ipversion
     */
    put_IpVersion(ipVersion) {
        result := ComCall(10, this, "int", ipVersion, "HRESULT")
        return result
    }

    /**
     * Specifies the protocol type setting for this port.
     * @remarks
     * 
     * The default protocol type is TCP for new ports.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwopenport-get_protocol
     */
    get_Protocol() {
        result := ComCall(11, this, "int*", &ipProtocol := 0, "HRESULT")
        return ipProtocol
    }

    /**
     * Specifies the protocol type setting for this port.
     * @remarks
     * 
     * The default protocol type is TCP for new ports.
     * 
     * 
     * @param {Integer} ipProtocol 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwopenport-put_protocol
     */
    put_Protocol(ipProtocol) {
        result := ComCall(12, this, "int", ipProtocol, "HRESULT")
        return result
    }

    /**
     * Specifiess the host-ordered port number for this port.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwopenport-get_port
     */
    get_Port() {
        result := ComCall(13, this, "int*", &portNumber := 0, "HRESULT")
        return portNumber
    }

    /**
     * Specifiess the host-ordered port number for this port.
     * @param {Integer} portNumber 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwopenport-put_port
     */
    put_Port(portNumber) {
        result := ComCall(14, this, "int", portNumber, "HRESULT")
        return result
    }

    /**
     * Controls the network scope from which the port can listen.
     * @remarks
     * 
     * When setting the
     *    Scope property, only <b>NET_FW_SCOPE_ALL</b> and <b>NET_FW_SCOPE_LOCAL_SUBNET</b> are valid.
     * 
     * The default value is
     *    <b>NET_FW_SCOPE_ALL</b> for new ports.
     * 
     * To create a custom scope, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwopenport-get_remoteaddresses">RemoteAddresses</a> property.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwopenport-get_scope
     */
    get_Scope() {
        result := ComCall(15, this, "int*", &scope := 0, "HRESULT")
        return scope
    }

    /**
     * Controls the network scope from which the port can listen.
     * @remarks
     * 
     * When setting the
     *    Scope property, only <b>NET_FW_SCOPE_ALL</b> and <b>NET_FW_SCOPE_LOCAL_SUBNET</b> are valid.
     * 
     * The default value is
     *    <b>NET_FW_SCOPE_ALL</b> for new ports.
     * 
     * To create a custom scope, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwopenport-get_remoteaddresses">RemoteAddresses</a> property.
     * 
     * 
     * @param {Integer} scope 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwopenport-put_scope
     */
    put_Scope(scope) {
        result := ComCall(16, this, "int", scope, "HRESULT")
        return result
    }

    /**
     * Specifies a set of remote addresses from which the port can listen for traffic.
     * @remarks
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
     * For a predefined address range, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwopenport-get_scope">Scope</a> property.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwopenport-get_remoteaddresses
     */
    get_RemoteAddresses() {
        remoteAddrs := BSTR()
        result := ComCall(17, this, "ptr", remoteAddrs, "HRESULT")
        return remoteAddrs
    }

    /**
     * Specifies a set of remote addresses from which the port can listen for traffic.
     * @remarks
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
     * For a predefined address range, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwopenport-get_scope">Scope</a> property.
     * 
     * 
     * @param {BSTR} remoteAddrs 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwopenport-put_remoteaddresses
     */
    put_RemoteAddresses(remoteAddrs) {
        remoteAddrs := remoteAddrs is String ? BSTR.Alloc(remoteAddrs).Value : remoteAddrs

        result := ComCall(18, this, "ptr", remoteAddrs, "HRESULT")
        return result
    }

    /**
     * Indicates whether the settings for this port are currently enabled.
     * @remarks
     * 
     * This property can be set to false (<b>VARIANT_FALSE</b>) to allow port settings to be stored in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwopenports">INetFWOpenPorts</a> collection without actually opening the port. 
     * 
     * The default value is true (<b>VARIANT_TRUE</b>) for new ports.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwopenport-get_enabled
     */
    get_Enabled() {
        result := ComCall(19, this, "short*", &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * Indicates whether the settings for this port are currently enabled.
     * @remarks
     * 
     * This property can be set to false (<b>VARIANT_FALSE</b>) to allow port settings to be stored in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwopenports">INetFWOpenPorts</a> collection without actually opening the port. 
     * 
     * The default value is true (<b>VARIANT_TRUE</b>) for new ports.
     * 
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwopenport-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(20, this, "short", enabled, "HRESULT")
        return result
    }

    /**
     * Indicates whether the port is defined by the system.
     * @remarks
     * 
     * Ports  with their <b>BuiltIn</b> property set to true (<b>VARIANT_TRUE</b>) are system specified and cannot be removed, only the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwopenport-get_enabled">Enabled</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwopenport-get_remoteaddresses">RemoteAddress</a>, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwopenport-get_scope">Scope</a> properties can be modified.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwopenport-get_builtin
     */
    get_BuiltIn() {
        result := ComCall(21, this, "short*", &builtIn := 0, "HRESULT")
        return builtIn
    }
}
