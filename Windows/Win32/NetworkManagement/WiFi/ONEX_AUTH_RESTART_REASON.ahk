#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the possible reasons that 802.1X authentication was restarted.
 * @remarks
 * 
 * The <b>ONEX_AUTH_RESTART_REASON</b> enumerated type is used by the 802.1X module, a new wireless configuration component supported on Windows Vista and  later.  
 * 
 * The <b>ONEX_AUTH_RESTART_REASON</b> specifies the possible values for the reason that 802.1X authentication was restarted. A value from this enumeration is returned  when  the <b>NotificationSource</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure is <b>WLAN_NOTIFICATION_SOURCE_ONEX</b>  and the <b>NotificationCode</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure for received notifications  is <b>OneXNotificationTypeAuthRestarted</b>. For this notification, the <b>pData</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure points to an  <b>ONEX_AUTH_RESTART_REASON</b> enumeration value that identifies the reason the authentication was restarted.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dot1x/ne-dot1x-onex_auth_restart_reason
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class ONEX_AUTH_RESTART_REASON{

    /**
     * The EAPHost component (the peer) requested the 802.1x module to restart 802.1X authentication. This results from a <a href="https://docs.microsoft.com/windows/win32/api/eaphostpeertypes/ne-eaphostpeertypes-eaphostpeerresponseaction">EapHostPeerProcessReceivedPacket</a> function call that returns an <a href="https://docs.microsoft.com/windows/desktop/api/eaphostpeertypes/ne-eaphostpeertypes-eaphostpeerresponseaction">EapHostPeerResponseAction</a> enumeration value of <b>EapHostPeerResponseStartAuthentication</b> in the <i>pEapOutput</i> parameter.
     * @type {Integer (Int32)}
     */
    static OneXRestartReasonPeerInitiated => 0

    /**
     * The Media Specific Module (MSM) initiated the 802.1X authentication restart.
     * @type {Integer (Int32)}
     */
    static OneXRestartReasonMsmInitiated => 1

    /**
     * The 802.1X authentication restart was the result of a state timeout. The timer expiring is the heldWhile timer of the 802.1X supplicant state machine defined in IEEE 802.1X - 2004 standard for Port-Based Network Access Control. The heldWhile timer is used by the supplicant state machine to define periods of time during which it
 * will not attempt to acquire an authenticator.
     * @type {Integer (Int32)}
     */
    static OneXRestartReasonOneXHeldStateTimeout => 2

    /**
     * The 802.1X authentication restart was the result of an state timeout. The timer expiring is the authWhile timer of the 802.1X supplicant port access entity defined in IEEE 802.1X - 2004 standard for Port-Based Network Access Control. The authWhile timer is used by the supplicant port access entity to determine how long to wait for a request from
 * the authenticator before timing it out.
     * @type {Integer (Int32)}
     */
    static OneXRestartReasonOneXAuthTimeout => 3

    /**
     * The 802.1X authentication restart was the result of a configuration change to the current profile.
     * @type {Integer (Int32)}
     */
    static OneXRestartReasonOneXConfigurationChanged => 4

    /**
     * The 802.1X authentication restart was the result of a change of user. This could occur if the current user logs off and new user logs on to the local computer.
     * @type {Integer (Int32)}
     */
    static OneXRestartReasonOneXUserChanged => 5

    /**
     * The 802.1X authentication restart was the result of receiving a notification from the EAP quarantine enforcement client (QEC) due to a network health change. If an EAPHost supplicant is participating in network access protection (NAP), the supplicant will respond to changes in the state of its network health. If that state changes, the supplicant must then initiate a re-authentication session. For more information, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a> function.
     * @type {Integer (Int32)}
     */
    static OneXRestartReasonQuarantineStateChanged => 6

    /**
     * The 802.1X authentication restart was caused by a new authentication attempt with alternate user credentials. EAP methods like MSCHAPv2 prefer to use logged-on user credentials for 802.1X authentication. If these user credentials do not work, then a dialog will be displayed to the user that asks permission to use alternate credentials for 802.1X authentication. For more information, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a> function and EAP_FLAG_PREFER_ALT_CREDENTIALS flag in the <i>dwflags</i> parameter.
     * @type {Integer (Int32)}
     */
    static OneXRestartReasonAltCredsTrial => 7

    /**
     * Indicates the end of the range that specifies the possible reasons that 802.1X authentication was restarted.
     * @type {Integer (Int32)}
     */
    static OneXRestartReasonInvalid => 8
}
