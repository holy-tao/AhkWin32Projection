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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-get_name
     */
    get_Name() {
        name := BSTR()
        result := ComCall(7, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-get_type
     */
    get_Type() {
        result := ComCall(8, this, "int*", &type := 0, "HRESULT")
        return type
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-get_customized
     */
    get_Customized() {
        result := ComCall(9, this, "short*", &customized := 0, "HRESULT")
        return customized
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-get_ipversion
     */
    get_IpVersion() {
        result := ComCall(10, this, "int*", &ipVersion := 0, "HRESULT")
        return ipVersion
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-get_scope
     */
    get_Scope() {
        result := ComCall(12, this, "int*", &scope := 0, "HRESULT")
        return scope
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-get_remoteaddresses
     */
    get_RemoteAddresses() {
        remoteAddrs := BSTR()
        result := ComCall(14, this, "ptr", remoteAddrs, "HRESULT")
        return remoteAddrs
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
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-get_enabled
     */
    get_Enabled() {
        result := ComCall(16, this, "short*", &enabled := 0, "HRESULT")
        return enabled
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
     * @returns {INetFwOpenPorts} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservice-get_globallyopenports
     */
    get_GloballyOpenPorts() {
        result := ComCall(18, this, "ptr*", &openPorts := 0, "HRESULT")
        return INetFwOpenPorts(openPorts)
    }
}
