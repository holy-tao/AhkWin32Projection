#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INetFwRemoteAdminSettings.ahk
#Include .\INetFwIcmpSettings.ahk
#Include .\INetFwOpenPorts.ahk
#Include .\INetFwServices.ahk
#Include .\INetFwAuthorizedApplications.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetFwProfile interface provides access to the firewall settings profile.
 * @remarks
 * 
 * Instances of this interface
 * are retrieved through the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy-get_currentprofile">CurrentProfile</a> property or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy-getprofilebytype">GetProfileByType</a> method
 * of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwpolicy">INetFwPolicy</a> interface.
 * 
 * All configuration changes take
 * effect immediately.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//netfw/nn-netfw-inetfwprofile
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwProfile extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetFwProfile
     * @type {Guid}
     */
    static IID => Guid("{174a0dda-e9f9-449d-993b-21ab667ca456}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Type", "get_FirewallEnabled", "put_FirewallEnabled", "get_ExceptionsNotAllowed", "put_ExceptionsNotAllowed", "get_NotificationsDisabled", "put_NotificationsDisabled", "get_UnicastResponsesToMulticastBroadcastDisabled", "put_UnicastResponsesToMulticastBroadcastDisabled", "get_RemoteAdminSettings", "get_IcmpSettings", "get_GloballyOpenPorts", "get_Services", "get_AuthorizedApplications"]

    /**
     * @type {Integer} 
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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_type
     */
    get_Type() {
        result := ComCall(7, this, "int*", &type := 0, "HRESULT")
        return type
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_firewallenabled
     */
    get_FirewallEnabled() {
        result := ComCall(8, this, "short*", &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-put_firewallenabled
     */
    put_FirewallEnabled(enabled) {
        result := ComCall(9, this, "short", enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_exceptionsnotallowed
     */
    get_ExceptionsNotAllowed() {
        result := ComCall(10, this, "short*", &notAllowed := 0, "HRESULT")
        return notAllowed
    }

    /**
     * 
     * @param {VARIANT_BOOL} notAllowed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-put_exceptionsnotallowed
     */
    put_ExceptionsNotAllowed(notAllowed) {
        result := ComCall(11, this, "short", notAllowed, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_notificationsdisabled
     */
    get_NotificationsDisabled() {
        result := ComCall(12, this, "short*", &disabled := 0, "HRESULT")
        return disabled
    }

    /**
     * 
     * @param {VARIANT_BOOL} disabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-put_notificationsdisabled
     */
    put_NotificationsDisabled(disabled) {
        result := ComCall(13, this, "short", disabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_unicastresponsestomulticastbroadcastdisabled
     */
    get_UnicastResponsesToMulticastBroadcastDisabled() {
        result := ComCall(14, this, "short*", &disabled := 0, "HRESULT")
        return disabled
    }

    /**
     * 
     * @param {VARIANT_BOOL} disabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-put_unicastresponsestomulticastbroadcastdisabled
     */
    put_UnicastResponsesToMulticastBroadcastDisabled(disabled) {
        result := ComCall(15, this, "short", disabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {INetFwRemoteAdminSettings} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_remoteadminsettings
     */
    get_RemoteAdminSettings() {
        result := ComCall(16, this, "ptr*", &remoteAdminSettings := 0, "HRESULT")
        return INetFwRemoteAdminSettings(remoteAdminSettings)
    }

    /**
     * 
     * @returns {INetFwIcmpSettings} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_icmpsettings
     */
    get_IcmpSettings() {
        result := ComCall(17, this, "ptr*", &icmpSettings := 0, "HRESULT")
        return INetFwIcmpSettings(icmpSettings)
    }

    /**
     * 
     * @returns {INetFwOpenPorts} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_globallyopenports
     */
    get_GloballyOpenPorts() {
        result := ComCall(18, this, "ptr*", &openPorts := 0, "HRESULT")
        return INetFwOpenPorts(openPorts)
    }

    /**
     * 
     * @returns {INetFwServices} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_services
     */
    get_Services() {
        result := ComCall(19, this, "ptr*", &services := 0, "HRESULT")
        return INetFwServices(services)
    }

    /**
     * 
     * @returns {INetFwAuthorizedApplications} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_authorizedapplications
     */
    get_AuthorizedApplications() {
        result := ComCall(20, this, "ptr*", &apps := 0, "HRESULT")
        return INetFwAuthorizedApplications(apps)
    }
}
