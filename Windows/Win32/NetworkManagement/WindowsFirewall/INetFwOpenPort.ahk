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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-get_name
     */
    get_Name() {
        name := BSTR()
        result := ComCall(7, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-get_ipversion
     */
    get_IpVersion() {
        result := ComCall(9, this, "int*", &ipVersion := 0, "HRESULT")
        return ipVersion
    }

    /**
     * 
     * @param {Integer} ipVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-put_ipversion
     */
    put_IpVersion(ipVersion) {
        result := ComCall(10, this, "int", ipVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-get_protocol
     */
    get_Protocol() {
        result := ComCall(11, this, "int*", &ipProtocol := 0, "HRESULT")
        return ipProtocol
    }

    /**
     * 
     * @param {Integer} ipProtocol 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-put_protocol
     */
    put_Protocol(ipProtocol) {
        result := ComCall(12, this, "int", ipProtocol, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-get_port
     */
    get_Port() {
        result := ComCall(13, this, "int*", &portNumber := 0, "HRESULT")
        return portNumber
    }

    /**
     * 
     * @param {Integer} portNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-put_port
     */
    put_Port(portNumber) {
        result := ComCall(14, this, "int", portNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-get_scope
     */
    get_Scope() {
        result := ComCall(15, this, "int*", &scope := 0, "HRESULT")
        return scope
    }

    /**
     * 
     * @param {Integer} scope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-put_scope
     */
    put_Scope(scope) {
        result := ComCall(16, this, "int", scope, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-get_remoteaddresses
     */
    get_RemoteAddresses() {
        remoteAddrs := BSTR()
        result := ComCall(17, this, "ptr", remoteAddrs, "HRESULT")
        return remoteAddrs
    }

    /**
     * 
     * @param {BSTR} remoteAddrs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-put_remoteaddresses
     */
    put_RemoteAddresses(remoteAddrs) {
        remoteAddrs := remoteAddrs is String ? BSTR.Alloc(remoteAddrs).Value : remoteAddrs

        result := ComCall(18, this, "ptr", remoteAddrs, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-get_enabled
     */
    get_Enabled() {
        result := ComCall(19, this, "short*", &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(20, this, "short", enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-get_builtin
     */
    get_BuiltIn() {
        result := ComCall(21, this, "short*", &builtIn := 0, "HRESULT")
        return builtIn
    }
}
