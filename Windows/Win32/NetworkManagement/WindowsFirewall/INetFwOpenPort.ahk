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
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-get_name
     */
    get_Name(name) {
        result := ComCall(7, this, "ptr", name, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} ipVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-get_ipversion
     */
    get_IpVersion(ipVersion) {
        result := ComCall(9, this, "int*", ipVersion, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} ipProtocol 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-get_protocol
     */
    get_Protocol(ipProtocol) {
        result := ComCall(11, this, "int*", ipProtocol, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} portNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-get_port
     */
    get_Port(portNumber) {
        result := ComCall(13, this, "int*", portNumber, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} scope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-get_scope
     */
    get_Scope(scope) {
        result := ComCall(15, this, "int*", scope, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} remoteAddrs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-get_remoteaddresses
     */
    get_RemoteAddresses(remoteAddrs) {
        result := ComCall(17, this, "ptr", remoteAddrs, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-get_enabled
     */
    get_Enabled(enabled) {
        result := ComCall(19, this, "ptr", enabled, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} builtIn 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwopenport-get_builtin
     */
    get_BuiltIn(builtIn) {
        result := ComCall(21, this, "ptr", builtIn, "HRESULT")
        return result
    }
}
