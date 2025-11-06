#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetFwRemoteAdminSettings interface provides access to the settings that control remote administration.
 * @remarks
 * 
  * An
  * instance of this interface is retrieved through the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwprofile-get_remoteadminsettings">RemoteAdminSettings</a>property of the INetFwProfile interface. 
  * 
  * All configuration changes take
  *  effect immediately.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//netfw/nn-netfw-inetfwremoteadminsettings
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwRemoteAdminSettings extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetFwRemoteAdminSettings
     * @type {Guid}
     */
    static IID => Guid("{d4becddf-6f73-4a83-b832-9c66874cd20e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IpVersion", "put_IpVersion", "get_Scope", "put_Scope", "get_RemoteAddresses", "put_RemoteAddresses", "get_Enabled", "put_Enabled"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwremoteadminsettings-get_ipversion
     */
    get_IpVersion() {
        result := ComCall(7, this, "int*", &ipVersion := 0, "HRESULT")
        return ipVersion
    }

    /**
     * 
     * @param {Integer} ipVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwremoteadminsettings-put_ipversion
     */
    put_IpVersion(ipVersion) {
        result := ComCall(8, this, "int", ipVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwremoteadminsettings-get_scope
     */
    get_Scope() {
        result := ComCall(9, this, "int*", &scope := 0, "HRESULT")
        return scope
    }

    /**
     * 
     * @param {Integer} scope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwremoteadminsettings-put_scope
     */
    put_Scope(scope) {
        result := ComCall(10, this, "int", scope, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwremoteadminsettings-get_remoteaddresses
     */
    get_RemoteAddresses() {
        remoteAddrs := BSTR()
        result := ComCall(11, this, "ptr", remoteAddrs, "HRESULT")
        return remoteAddrs
    }

    /**
     * 
     * @param {BSTR} remoteAddrs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwremoteadminsettings-put_remoteaddresses
     */
    put_RemoteAddresses(remoteAddrs) {
        remoteAddrs := remoteAddrs is String ? BSTR.Alloc(remoteAddrs).Value : remoteAddrs

        result := ComCall(12, this, "ptr", remoteAddrs, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwremoteadminsettings-get_enabled
     */
    get_Enabled() {
        result := ComCall(13, this, "short*", &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwremoteadminsettings-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(14, this, "short", enabled, "HRESULT")
        return result
    }
}
