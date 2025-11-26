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
     * Specifies the friendly name of this application.
     * @remarks
     * 
     * This property is required.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwauthorizedapplication-get_name
     */
    get_Name() {
        name := BSTR()
        result := ComCall(7, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * Specifies the friendly name of this application.
     * @remarks
     * 
     * This property is required.
     * 
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwauthorizedapplication-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * Specifies the process image file name for this application.
     * @remarks
     * 
     * The image file name must be a fully qualified path and reference an existing application.  The name may contain environment variables.
     * 
     * This property is required.
     * 
     * A demonstration of this property can be found in the VBScript code example <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ics/wf-adding-an-application">Adding an Application</a>.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwauthorizedapplication-get_processimagefilename
     */
    get_ProcessImageFileName() {
        imageFileName := BSTR()
        result := ComCall(9, this, "ptr", imageFileName, "HRESULT")
        return imageFileName
    }

    /**
     * Specifies the process image file name for this application.
     * @remarks
     * 
     * The image file name must be a fully qualified path and reference an existing application.  The name may contain environment variables.
     * 
     * This property is required.
     * 
     * A demonstration of this property can be found in the VBScript code example <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ics/wf-adding-an-application">Adding an Application</a>.
     * 
     * 
     * @param {BSTR} imageFileName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwauthorizedapplication-put_processimagefilename
     */
    put_ProcessImageFileName(imageFileName) {
        imageFileName := imageFileName is String ? BSTR.Alloc(imageFileName).Value : imageFileName

        result := ComCall(10, this, "ptr", imageFileName, "HRESULT")
        return result
    }

    /**
     * Specifies the IP version setting for this application.
     * @remarks
     * 
     * Only <a href="https://docs.microsoft.com/windows/desktop/api/icftypes/ne-icftypes-net_fw_ip_version">NET_FW_IP_VERSION_ANY</a> is supported and this is the default for new applications.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwauthorizedapplication-get_ipversion
     */
    get_IpVersion() {
        result := ComCall(11, this, "int*", &ipVersion := 0, "HRESULT")
        return ipVersion
    }

    /**
     * Specifies the IP version setting for this application.
     * @remarks
     * 
     * Only <a href="https://docs.microsoft.com/windows/desktop/api/icftypes/ne-icftypes-net_fw_ip_version">NET_FW_IP_VERSION_ANY</a> is supported and this is the default for new applications.
     * 
     * 
     * @param {Integer} ipVersion 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwauthorizedapplication-put_ipversion
     */
    put_IpVersion(ipVersion) {
        result := ComCall(12, this, "int", ipVersion, "HRESULT")
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
     * To create a custom scope, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwauthorizedapplication-get_remoteaddresses">RemoteAddresses</a> property.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwauthorizedapplication-get_scope
     */
    get_Scope() {
        result := ComCall(13, this, "int*", &scope := 0, "HRESULT")
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
     * To create a custom scope, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwauthorizedapplication-get_remoteaddresses">RemoteAddresses</a> property.
     * 
     * 
     * @param {Integer} scope 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwauthorizedapplication-put_scope
     */
    put_Scope(scope) {
        result := ComCall(14, this, "int", scope, "HRESULT")
        return result
    }

    /**
     * Specifies a set of the remote addresses from which the application can listen for traffic.
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
     * For a predefined address range, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwauthorizedapplication-get_scope">Scope</a> property.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwauthorizedapplication-get_remoteaddresses
     */
    get_RemoteAddresses() {
        remoteAddrs := BSTR()
        result := ComCall(15, this, "ptr", remoteAddrs, "HRESULT")
        return remoteAddrs
    }

    /**
     * Specifies a set of the remote addresses from which the application can listen for traffic.
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
     * For a predefined address range, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwauthorizedapplication-get_scope">Scope</a> property.
     * 
     * 
     * @param {BSTR} remoteAddrs 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwauthorizedapplication-put_remoteaddresses
     */
    put_RemoteAddresses(remoteAddrs) {
        remoteAddrs := remoteAddrs is String ? BSTR.Alloc(remoteAddrs).Value : remoteAddrs

        result := ComCall(16, this, "ptr", remoteAddrs, "HRESULT")
        return result
    }

    /**
     * Indicates whether the settings for this application are currently enabled.
     * @remarks
     * 
     * This property can be set to false (<b>VARIANT_FALSE</b>) to allow application  settings to be stored in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwauthorizedapplications">INetFWAuthorizedApplications</a> collection without actually authorizing the application. 
     * 
     * The default value is true (<b>VARIANT_TRUE</b>) for new applications.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwauthorizedapplication-get_enabled
     */
    get_Enabled() {
        result := ComCall(17, this, "short*", &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * Indicates whether the settings for this application are currently enabled.
     * @remarks
     * 
     * This property can be set to false (<b>VARIANT_FALSE</b>) to allow application  settings to be stored in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwauthorizedapplications">INetFWAuthorizedApplications</a> collection without actually authorizing the application. 
     * 
     * The default value is true (<b>VARIANT_TRUE</b>) for new applications.
     * 
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwauthorizedapplication-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(18, this, "short", enabled, "HRESULT")
        return result
    }
}
