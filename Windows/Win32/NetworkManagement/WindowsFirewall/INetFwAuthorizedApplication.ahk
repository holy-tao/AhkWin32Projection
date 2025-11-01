#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetFwAuthorizedApplication interface provides access to the properties of an application that has been authorized have openings in the firewall.
 * @remarks
 * 
  * When creating new applications, this interface is supported by the HNetCfg.FwAuthorizedApplication COM object.  
  * 
  * For reading or modifying existing applications, instances of this interface are retrieved through the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwauthorizedapplications">INetFwAuthorizedApplications</a> collection.
  * 
  * All configuration changes take effect immediately.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//netfw/nn-netfw-inetfwauthorizedapplication
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwAuthorizedApplication extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetFwAuthorizedApplication
     * @type {Guid}
     */
    static IID => Guid("{b5e64ffa-c2c5-444e-a301-fb5e00018050}")

    /**
     * The class identifier for NetFwAuthorizedApplication
     * @type {Guid}
     */
    static CLSID => Guid("{ec9846b3-2762-4a6b-a214-6acb603462d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "put_Name", "get_ProcessImageFileName", "put_ProcessImageFileName", "get_IpVersion", "put_IpVersion", "get_Scope", "put_Scope", "get_RemoteAddresses", "put_RemoteAddresses", "get_Enabled", "put_Enabled"]

    /**
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-get_name
     */
    get_Name(name) {
        result := ComCall(7, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} imageFileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-get_processimagefilename
     */
    get_ProcessImageFileName(imageFileName) {
        result := ComCall(9, this, "ptr", imageFileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} imageFileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-put_processimagefilename
     */
    put_ProcessImageFileName(imageFileName) {
        imageFileName := imageFileName is String ? BSTR.Alloc(imageFileName).Value : imageFileName

        result := ComCall(10, this, "ptr", imageFileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} ipVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-get_ipversion
     */
    get_IpVersion(ipVersion) {
        ipVersionMarshal := ipVersion is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, ipVersionMarshal, ipVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ipVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-put_ipversion
     */
    put_IpVersion(ipVersion) {
        result := ComCall(12, this, "int", ipVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} scope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-get_scope
     */
    get_Scope(scope) {
        scopeMarshal := scope is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, scopeMarshal, scope, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-put_scope
     */
    put_Scope(scope) {
        result := ComCall(14, this, "int", scope, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} remoteAddrs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-get_remoteaddresses
     */
    get_RemoteAddresses(remoteAddrs) {
        result := ComCall(15, this, "ptr", remoteAddrs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} remoteAddrs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-put_remoteaddresses
     */
    put_RemoteAddresses(remoteAddrs) {
        remoteAddrs := remoteAddrs is String ? BSTR.Alloc(remoteAddrs).Value : remoteAddrs

        result := ComCall(16, this, "ptr", remoteAddrs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-get_enabled
     */
    get_Enabled(enabled) {
        result := ComCall(17, this, "ptr", enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(18, this, "short", enabled, "HRESULT")
        return result
    }
}
