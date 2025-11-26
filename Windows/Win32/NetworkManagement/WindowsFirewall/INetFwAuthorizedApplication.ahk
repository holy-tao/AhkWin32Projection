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
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {BSTR} 
     */
    ProcessImageFileName {
        get => this.get_ProcessImageFileName()
        set => this.put_ProcessImageFileName(value)
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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-get_name
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
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-get_processimagefilename
     */
    get_ProcessImageFileName() {
        imageFileName := BSTR()
        result := ComCall(9, this, "ptr", imageFileName, "HRESULT")
        return imageFileName
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-get_ipversion
     */
    get_IpVersion() {
        result := ComCall(11, this, "int*", &ipVersion := 0, "HRESULT")
        return ipVersion
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-get_scope
     */
    get_Scope() {
        result := ComCall(13, this, "int*", &scope := 0, "HRESULT")
        return scope
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-get_remoteaddresses
     */
    get_RemoteAddresses() {
        remoteAddrs := BSTR()
        result := ComCall(15, this, "ptr", remoteAddrs, "HRESULT")
        return remoteAddrs
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
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-get_enabled
     */
    get_Enabled() {
        result := ComCall(17, this, "short*", &enabled := 0, "HRESULT")
        return enabled
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
