#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-get_name
     */
    get_Name(name) {
        result := ComCall(7, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} type 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-get_type
     */
    get_Type(type) {
        typeMarshal := type is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, typeMarshal, type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} customized 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-get_customized
     */
    get_Customized(customized) {
        result := ComCall(9, this, "ptr", customized, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} ipVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-get_ipversion
     */
    get_IpVersion(ipVersion) {
        ipVersionMarshal := ipVersion is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, ipVersionMarshal, ipVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ipVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-put_ipversion
     */
    put_IpVersion(ipVersion) {
        result := ComCall(11, this, "int", ipVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} scope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-get_scope
     */
    get_Scope(scope) {
        scopeMarshal := scope is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, scopeMarshal, scope, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-put_scope
     */
    put_Scope(scope) {
        result := ComCall(13, this, "int", scope, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} remoteAddrs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-get_remoteaddresses
     */
    get_RemoteAddresses(remoteAddrs) {
        result := ComCall(14, this, "ptr", remoteAddrs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} remoteAddrs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-put_remoteaddresses
     */
    put_RemoteAddresses(remoteAddrs) {
        remoteAddrs := remoteAddrs is String ? BSTR.Alloc(remoteAddrs).Value : remoteAddrs

        result := ComCall(15, this, "ptr", remoteAddrs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-get_enabled
     */
    get_Enabled(enabled) {
        result := ComCall(16, this, "ptr", enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(17, this, "short", enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<INetFwOpenPorts>} openPorts 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-get_globallyopenports
     */
    get_GloballyOpenPorts(openPorts) {
        result := ComCall(18, this, "ptr*", openPorts, "HRESULT")
        return result
    }
}
