#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Integer>} type 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_type
     */
    get_Type(type) {
        typeMarshal := type is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, typeMarshal, type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_firewallenabled
     */
    get_FirewallEnabled(enabled) {
        result := ComCall(8, this, "ptr", enabled, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} notAllowed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_exceptionsnotallowed
     */
    get_ExceptionsNotAllowed(notAllowed) {
        result := ComCall(10, this, "ptr", notAllowed, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} disabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_notificationsdisabled
     */
    get_NotificationsDisabled(disabled) {
        result := ComCall(12, this, "ptr", disabled, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} disabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_unicastresponsestomulticastbroadcastdisabled
     */
    get_UnicastResponsesToMulticastBroadcastDisabled(disabled) {
        result := ComCall(14, this, "ptr", disabled, "HRESULT")
        return result
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
     * @param {Pointer<INetFwRemoteAdminSettings>} remoteAdminSettings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_remoteadminsettings
     */
    get_RemoteAdminSettings(remoteAdminSettings) {
        result := ComCall(16, this, "ptr*", remoteAdminSettings, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<INetFwIcmpSettings>} icmpSettings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_icmpsettings
     */
    get_IcmpSettings(icmpSettings) {
        result := ComCall(17, this, "ptr*", icmpSettings, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<INetFwOpenPorts>} openPorts 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_globallyopenports
     */
    get_GloballyOpenPorts(openPorts) {
        result := ComCall(18, this, "ptr*", openPorts, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<INetFwServices>} services 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_services
     */
    get_Services(services) {
        result := ComCall(19, this, "ptr*", services, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<INetFwAuthorizedApplications>} apps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwprofile-get_authorizedapplications
     */
    get_AuthorizedApplications(apps) {
        result := ComCall(20, this, "ptr*", apps, "HRESULT")
        return result
    }
}
