#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\INetFwRemoteAdminSettings.ahk" { INetFwRemoteAdminSettings }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\NET_FW_PROFILE_TYPE.ahk" { NET_FW_PROFILE_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\INetFwOpenPorts.ahk" { INetFwOpenPorts }
#Import ".\INetFwIcmpSettings.ahk" { INetFwIcmpSettings }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\INetFwAuthorizedApplications.ahk" { INetFwAuthorizedApplications }
#Import ".\INetFwServices.ahk" { INetFwServices }

/**
 * The INetFwProfile interface provides access to the firewall settings profile.
 * @remarks
 * Instances of this interface
 * are retrieved through the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy-get_currentprofile">CurrentProfile</a> property or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy-getprofilebytype">GetProfileByType</a> method
 * of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwpolicy">INetFwPolicy</a> interface.
 * 
 * All configuration changes take
 * effect immediately.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/nn-netfw-inetfwprofile
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INetFwProfile extends IDispatch {
    /**
     * The interface identifier for INetFwProfile
     * @type {Guid}
     */
    static IID := Guid("{174a0dda-e9f9-449d-993b-21ab667ca456}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetFwProfile interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Type                                         : IntPtr
        get_FirewallEnabled                              : IntPtr
        put_FirewallEnabled                              : IntPtr
        get_ExceptionsNotAllowed                         : IntPtr
        put_ExceptionsNotAllowed                         : IntPtr
        get_NotificationsDisabled                        : IntPtr
        put_NotificationsDisabled                        : IntPtr
        get_UnicastResponsesToMulticastBroadcastDisabled : IntPtr
        put_UnicastResponsesToMulticastBroadcastDisabled : IntPtr
        get_RemoteAdminSettings                          : IntPtr
        get_IcmpSettings                                 : IntPtr
        get_GloballyOpenPorts                            : IntPtr
        get_Services                                     : IntPtr
        get_AuthorizedApplications                       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetFwProfile.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {NET_FW_PROFILE_TYPE} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    FirewallEnabled {
        get => this.get_FirewallEnabled()
        set => this.put_FirewallEnabled(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ExceptionsNotAllowed {
        get => this.get_ExceptionsNotAllowed()
        set => this.put_ExceptionsNotAllowed(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    NotificationsDisabled {
        get => this.get_NotificationsDisabled()
        set => this.put_NotificationsDisabled(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    UnicastResponsesToMulticastBroadcastDisabled {
        get => this.get_UnicastResponsesToMulticastBroadcastDisabled()
        set => this.put_UnicastResponsesToMulticastBroadcastDisabled(value)
    }

    /**
     * @type {INetFwRemoteAdminSettings} 
     */
    RemoteAdminSettings {
        get => this.get_RemoteAdminSettings()
    }

    /**
     * @type {INetFwIcmpSettings} 
     */
    IcmpSettings {
        get => this.get_IcmpSettings()
    }

    /**
     * @type {INetFwOpenPorts} 
     */
    GloballyOpenPorts {
        get => this.get_GloballyOpenPorts()
    }

    /**
     * @type {INetFwServices} 
     */
    Services {
        get => this.get_Services()
    }

    /**
     * @type {INetFwAuthorizedApplications} 
     */
    AuthorizedApplications {
        get => this.get_AuthorizedApplications()
    }

    /**
     * Specifies the type of the profile.
     * @returns {NET_FW_PROFILE_TYPE} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_type
     */
    get_Type() {
        result := ComCall(7, this, "int*", &type := 0, "HRESULT")
        return type
    }

    /**
     * Indicates whether the firewall is enabled. (Get)
     * @remarks
     * The resulting  firewall status is based on the local policy from the local store. Use the procedure <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ics/checking-the-effective-firewall-status">Checking the Effective Firewall Status</a> to determine the overall operational state.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_firewallenabled
     */
    get_FirewallEnabled() {
        result := ComCall(8, this, VARIANT_BOOL.Ptr, &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * Indicates whether the firewall is enabled. (Put)
     * @remarks
     * The resulting  firewall status is based on the local policy from the local store. Use the procedure <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ics/checking-the-effective-firewall-status">Checking the Effective Firewall Status</a> to determine the overall operational state.
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-put_firewallenabled
     */
    put_FirewallEnabled(enabled) {
        result := ComCall(9, this, VARIANT_BOOL, enabled, "HRESULT")
        return result
    }

    /**
     * Indicates whether the firewall should not allow exceptions. (Get)
     * @remarks
     * All interfaces are firewalled. This means that all the exceptions; such as GloballyOpenPorts, Applications, or Services, which are  specified in the profile, are ignored
     *    and only locally initiated traffic is allowed.
     * 
     *  The resulting  firewall status is determined by the combination of  two levels: First check the global operation mode, then the mode on the interface of interest. Use the procedure <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ics/checking-the-effective-firewall-status">Checking the Effective Firewall Status</a> to determine the overall operational state.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_exceptionsnotallowed
     */
    get_ExceptionsNotAllowed() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &notAllowed := 0, "HRESULT")
        return notAllowed
    }

    /**
     * Indicates whether the firewall should not allow exceptions. (Put)
     * @remarks
     * All interfaces are firewalled. This means that all the exceptions; such as GloballyOpenPorts, Applications, or Services, which are  specified in the profile, are ignored
     *    and only locally initiated traffic is allowed.
     * 
     *  The resulting  firewall status is determined by the combination of  two levels: First check the global operation mode, then the mode on the interface of interest. Use the procedure <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ics/checking-the-effective-firewall-status">Checking the Effective Firewall Status</a> to determine the overall operational state.
     * @param {VARIANT_BOOL} notAllowed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-put_exceptionsnotallowed
     */
    put_ExceptionsNotAllowed(notAllowed) {
        result := ComCall(11, this, VARIANT_BOOL, notAllowed, "HRESULT")
        return result
    }

    /**
     * Indicates whether interactive firewall notifications are disabled. (INetFwProfile.get_NotificationsDisabled)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_notificationsdisabled
     */
    get_NotificationsDisabled() {
        result := ComCall(12, this, VARIANT_BOOL.Ptr, &disabled := 0, "HRESULT")
        return disabled
    }

    /**
     * Indicates whether interactive firewall notifications are disabled. (INetFwProfile.put_NotificationsDisabled)
     * @param {VARIANT_BOOL} disabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-put_notificationsdisabled
     */
    put_NotificationsDisabled(disabled) {
        result := ComCall(13, this, VARIANT_BOOL, disabled, "HRESULT")
        return result
    }

    /**
     * Indicates whether the firewall should not allow unicast responses to multicast and broadcast traffic. (INetFwProfile.get_UnicastResponsesToMulticastBroadcastDisabled)
     * @remarks
     * If a PC sends a broadcast packet, a unicast response is allowed for three seconds. Use this property to change this behavior.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_unicastresponsestomulticastbroadcastdisabled
     */
    get_UnicastResponsesToMulticastBroadcastDisabled() {
        result := ComCall(14, this, VARIANT_BOOL.Ptr, &disabled := 0, "HRESULT")
        return disabled
    }

    /**
     * Indicates whether the firewall should not allow unicast responses to multicast and broadcast traffic. (INetFwProfile.put_UnicastResponsesToMulticastBroadcastDisabled)
     * @remarks
     * If a PC sends a broadcast packet, a unicast response is allowed for three seconds. Use this property to change this behavior.
     * @param {VARIANT_BOOL} disabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-put_unicastresponsestomulticastbroadcastdisabled
     */
    put_UnicastResponsesToMulticastBroadcastDisabled(disabled) {
        result := ComCall(15, this, VARIANT_BOOL, disabled, "HRESULT")
        return result
    }

    /**
     * Specifies the settings governing remote administration.
     * @returns {INetFwRemoteAdminSettings} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_remoteadminsettings
     */
    get_RemoteAdminSettings() {
        result := ComCall(16, this, "ptr*", &remoteAdminSettings := 0, "HRESULT")
        return INetFwRemoteAdminSettings(remoteAdminSettings)
    }

    /**
     * Retrieves the ICMP settings of the profile.
     * @returns {INetFwIcmpSettings} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_icmpsettings
     */
    get_IcmpSettings() {
        result := ComCall(17, this, "ptr*", &icmpSettings := 0, "HRESULT")
        return INetFwIcmpSettings(icmpSettings)
    }

    /**
     * Retrieves the collection of globally open ports of the profile.
     * @returns {INetFwOpenPorts} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_globallyopenports
     */
    get_GloballyOpenPorts() {
        result := ComCall(18, this, "ptr*", &openPorts := 0, "HRESULT")
        return INetFwOpenPorts(openPorts)
    }

    /**
     * Retrieves the collection of services of the profile.
     * @returns {INetFwServices} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_services
     */
    get_Services() {
        result := ComCall(19, this, "ptr*", &services := 0, "HRESULT")
        return INetFwServices(services)
    }

    /**
     * Retrieves the collection of authorized applications of the profile.
     * @returns {INetFwAuthorizedApplications} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_authorizedapplications
     */
    get_AuthorizedApplications() {
        result := ComCall(20, this, "ptr*", &apps := 0, "HRESULT")
        return INetFwAuthorizedApplications(apps)
    }

    Query(iid) {
        if (INetFwProfile.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.get_FirewallEnabled := CallbackCreate(GetMethod(implObj, "get_FirewallEnabled"), flags, 2)
        this.vtbl.put_FirewallEnabled := CallbackCreate(GetMethod(implObj, "put_FirewallEnabled"), flags, 2)
        this.vtbl.get_ExceptionsNotAllowed := CallbackCreate(GetMethod(implObj, "get_ExceptionsNotAllowed"), flags, 2)
        this.vtbl.put_ExceptionsNotAllowed := CallbackCreate(GetMethod(implObj, "put_ExceptionsNotAllowed"), flags, 2)
        this.vtbl.get_NotificationsDisabled := CallbackCreate(GetMethod(implObj, "get_NotificationsDisabled"), flags, 2)
        this.vtbl.put_NotificationsDisabled := CallbackCreate(GetMethod(implObj, "put_NotificationsDisabled"), flags, 2)
        this.vtbl.get_UnicastResponsesToMulticastBroadcastDisabled := CallbackCreate(GetMethod(implObj, "get_UnicastResponsesToMulticastBroadcastDisabled"), flags, 2)
        this.vtbl.put_UnicastResponsesToMulticastBroadcastDisabled := CallbackCreate(GetMethod(implObj, "put_UnicastResponsesToMulticastBroadcastDisabled"), flags, 2)
        this.vtbl.get_RemoteAdminSettings := CallbackCreate(GetMethod(implObj, "get_RemoteAdminSettings"), flags, 2)
        this.vtbl.get_IcmpSettings := CallbackCreate(GetMethod(implObj, "get_IcmpSettings"), flags, 2)
        this.vtbl.get_GloballyOpenPorts := CallbackCreate(GetMethod(implObj, "get_GloballyOpenPorts"), flags, 2)
        this.vtbl.get_Services := CallbackCreate(GetMethod(implObj, "get_Services"), flags, 2)
        this.vtbl.get_AuthorizedApplications := CallbackCreate(GetMethod(implObj, "get_AuthorizedApplications"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.get_FirewallEnabled)
        CallbackFree(this.vtbl.put_FirewallEnabled)
        CallbackFree(this.vtbl.get_ExceptionsNotAllowed)
        CallbackFree(this.vtbl.put_ExceptionsNotAllowed)
        CallbackFree(this.vtbl.get_NotificationsDisabled)
        CallbackFree(this.vtbl.put_NotificationsDisabled)
        CallbackFree(this.vtbl.get_UnicastResponsesToMulticastBroadcastDisabled)
        CallbackFree(this.vtbl.put_UnicastResponsesToMulticastBroadcastDisabled)
        CallbackFree(this.vtbl.get_RemoteAdminSettings)
        CallbackFree(this.vtbl.get_IcmpSettings)
        CallbackFree(this.vtbl.get_GloballyOpenPorts)
        CallbackFree(this.vtbl.get_Services)
        CallbackFree(this.vtbl.get_AuthorizedApplications)
    }
}
