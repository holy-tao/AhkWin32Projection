#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NET_FW_SCOPE.ahk" { NET_FW_SCOPE }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\NET_FW_IP_VERSION.ahk" { NET_FW_IP_VERSION }

/**
 * The INetFwAuthorizedApplication interface provides access to the properties of an application that has been authorized have openings in the firewall.
 * @remarks
 * When creating new applications, this interface is supported by the HNetCfg.FwAuthorizedApplication COM object.  
 * 
 * For reading or modifying existing applications, instances of this interface are retrieved through the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwauthorizedapplications">INetFwAuthorizedApplications</a> collection.
 * 
 * All configuration changes take effect immediately.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/nn-netfw-inetfwauthorizedapplication
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INetFwAuthorizedApplication extends IDispatch {
    /**
     * The interface identifier for INetFwAuthorizedApplication
     * @type {Guid}
     */
    static IID := Guid("{b5e64ffa-c2c5-444e-a301-fb5e00018050}")

    /**
     * The class identifier for NetFwAuthorizedApplication
     * @type {Guid}
     */
    static CLSID := Guid("{ec9846b3-2762-4a6b-a214-6acb603462d2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetFwAuthorizedApplication interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name                 : IntPtr
        put_Name                 : IntPtr
        get_ProcessImageFileName : IntPtr
        put_ProcessImageFileName : IntPtr
        get_IpVersion            : IntPtr
        put_IpVersion            : IntPtr
        get_Scope                : IntPtr
        put_Scope                : IntPtr
        get_RemoteAddresses      : IntPtr
        put_RemoteAddresses      : IntPtr
        get_Enabled              : IntPtr
        put_Enabled              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetFwAuthorizedApplication.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {NET_FW_IP_VERSION} 
     */
    IpVersion {
        get => this.get_IpVersion()
        set => this.put_IpVersion(value)
    }

    /**
     * @type {NET_FW_SCOPE} 
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
     * Specifies the friendly name of this application. (Get)
     * @remarks
     * This property is required.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-get_name
     */
    get_Name() {
        name := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * Specifies the friendly name of this application. (Put)
     * @remarks
     * This property is required.
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, BSTR, name, "HRESULT")
        return result
    }

    /**
     * Specifies the process image file name for this application. (Get)
     * @remarks
     * The image file name must be a fully qualified path and reference an existing application.  The name may contain environment variables.
     * 
     * This property is required.
     * 
     * A demonstration of this property can be found in the VBScript code example <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ics/wf-adding-an-application">Adding an Application</a>.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-get_processimagefilename
     */
    get_ProcessImageFileName() {
        imageFileName := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, imageFileName, "HRESULT")
        return imageFileName
    }

    /**
     * Specifies the process image file name for this application. (Put)
     * @remarks
     * The image file name must be a fully qualified path and reference an existing application.  The name may contain environment variables.
     * 
     * This property is required.
     * 
     * A demonstration of this property can be found in the VBScript code example <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ics/wf-adding-an-application">Adding an Application</a>.
     * @param {BSTR} imageFileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-put_processimagefilename
     */
    put_ProcessImageFileName(imageFileName) {
        imageFileName := imageFileName is String ? BSTR.Alloc(imageFileName).Value : imageFileName

        result := ComCall(10, this, BSTR, imageFileName, "HRESULT")
        return result
    }

    /**
     * Specifies the IP version setting for this application. (Get)
     * @remarks
     * Only <a href="https://docs.microsoft.com/windows/desktop/api/icftypes/ne-icftypes-net_fw_ip_version">NET_FW_IP_VERSION_ANY</a> is supported and this is the default for new applications.
     * @returns {NET_FW_IP_VERSION} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-get_ipversion
     */
    get_IpVersion() {
        result := ComCall(11, this, "int*", &ipVersion := 0, "HRESULT")
        return ipVersion
    }

    /**
     * Specifies the IP version setting for this application. (Put)
     * @remarks
     * Only <a href="https://docs.microsoft.com/windows/desktop/api/icftypes/ne-icftypes-net_fw_ip_version">NET_FW_IP_VERSION_ANY</a> is supported and this is the default for new applications.
     * @param {NET_FW_IP_VERSION} ipVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-put_ipversion
     */
    put_IpVersion(ipVersion) {
        result := ComCall(12, this, NET_FW_IP_VERSION, ipVersion, "HRESULT")
        return result
    }

    /**
     * Controls the network scope from which the port can listen. (INetFwAuthorizedApplication.get_Scope)
     * @remarks
     * When setting the
     *    Scope property, only <b>NET_FW_SCOPE_ALL</b> and <b>NET_FW_SCOPE_LOCAL_SUBNET</b> are valid.
     *    
     * 
     * The default value is
     *    <b>NET_FW_SCOPE_ALL</b> for new ports.
     * 
     * To create a custom scope, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwauthorizedapplication-get_remoteaddresses">RemoteAddresses</a> property.
     * @returns {NET_FW_SCOPE} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-get_scope
     */
    get_Scope() {
        result := ComCall(13, this, "int*", &scope := 0, "HRESULT")
        return scope
    }

    /**
     * Controls the network scope from which the port can listen. (INetFwAuthorizedApplication.put_Scope)
     * @remarks
     * When setting the
     *    Scope property, only <b>NET_FW_SCOPE_ALL</b> and <b>NET_FW_SCOPE_LOCAL_SUBNET</b> are valid.
     *    
     * 
     * The default value is
     *    <b>NET_FW_SCOPE_ALL</b> for new ports.
     * 
     * To create a custom scope, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwauthorizedapplication-get_remoteaddresses">RemoteAddresses</a> property.
     * @param {NET_FW_SCOPE} scope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-put_scope
     */
    put_Scope(scope) {
        result := ComCall(14, this, NET_FW_SCOPE, scope, "HRESULT")
        return result
    }

    /**
     * Specifies a set of the remote addresses from which the application can listen for traffic. (Get)
     * @remarks
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-get_remoteaddresses
     */
    get_RemoteAddresses() {
        remoteAddrs := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, remoteAddrs, "HRESULT")
        return remoteAddrs
    }

    /**
     * Specifies a set of the remote addresses from which the application can listen for traffic. (Put)
     * @remarks
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
     * @param {BSTR} remoteAddrs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-put_remoteaddresses
     */
    put_RemoteAddresses(remoteAddrs) {
        remoteAddrs := remoteAddrs is String ? BSTR.Alloc(remoteAddrs).Value : remoteAddrs

        result := ComCall(16, this, BSTR, remoteAddrs, "HRESULT")
        return result
    }

    /**
     * Indicates whether the settings for this application are currently enabled. (Get)
     * @remarks
     * This property can be set to false (<b>VARIANT_FALSE</b>) to allow application  settings to be stored in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwauthorizedapplications">INetFWAuthorizedApplications</a> collection without actually authorizing the application. 
     * 
     * The default value is true (<b>VARIANT_TRUE</b>) for new applications.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-get_enabled
     */
    get_Enabled() {
        result := ComCall(17, this, VARIANT_BOOL.Ptr, &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * Indicates whether the settings for this application are currently enabled. (Put)
     * @remarks
     * This property can be set to false (<b>VARIANT_FALSE</b>) to allow application  settings to be stored in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwauthorizedapplications">INetFWAuthorizedApplications</a> collection without actually authorizing the application. 
     * 
     * The default value is true (<b>VARIANT_TRUE</b>) for new applications.
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwauthorizedapplication-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(18, this, VARIANT_BOOL, enabled, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetFwAuthorizedApplication.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
        this.vtbl.get_ProcessImageFileName := CallbackCreate(GetMethod(implObj, "get_ProcessImageFileName"), flags, 2)
        this.vtbl.put_ProcessImageFileName := CallbackCreate(GetMethod(implObj, "put_ProcessImageFileName"), flags, 2)
        this.vtbl.get_IpVersion := CallbackCreate(GetMethod(implObj, "get_IpVersion"), flags, 2)
        this.vtbl.put_IpVersion := CallbackCreate(GetMethod(implObj, "put_IpVersion"), flags, 2)
        this.vtbl.get_Scope := CallbackCreate(GetMethod(implObj, "get_Scope"), flags, 2)
        this.vtbl.put_Scope := CallbackCreate(GetMethod(implObj, "put_Scope"), flags, 2)
        this.vtbl.get_RemoteAddresses := CallbackCreate(GetMethod(implObj, "get_RemoteAddresses"), flags, 2)
        this.vtbl.put_RemoteAddresses := CallbackCreate(GetMethod(implObj, "put_RemoteAddresses"), flags, 2)
        this.vtbl.get_Enabled := CallbackCreate(GetMethod(implObj, "get_Enabled"), flags, 2)
        this.vtbl.put_Enabled := CallbackCreate(GetMethod(implObj, "put_Enabled"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Name)
        CallbackFree(this.vtbl.get_ProcessImageFileName)
        CallbackFree(this.vtbl.put_ProcessImageFileName)
        CallbackFree(this.vtbl.get_IpVersion)
        CallbackFree(this.vtbl.put_IpVersion)
        CallbackFree(this.vtbl.get_Scope)
        CallbackFree(this.vtbl.put_Scope)
        CallbackFree(this.vtbl.get_RemoteAddresses)
        CallbackFree(this.vtbl.put_RemoteAddresses)
        CallbackFree(this.vtbl.get_Enabled)
        CallbackFree(this.vtbl.put_Enabled)
    }
}
