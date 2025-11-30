#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the possible values of the identity used for 802.1X authentication status.
 * @remarks
 * 
 * The <b>ONEX_AUTH_IDENTITY</b> enumerated type is used by the 802.1X module, a new wireless configuration component supported on Windows Vista and  later.  
 * 
 * The <b>ONEX_AUTH_IDENTITY</b> specifies the possible values of the identity used for 802.1X authentication. The <b>ONEX_AUTH_IDENTITY</b> is a function of the
 *     802.1X authentication mode selected and various system triggers (user logon and logoff operations, for example).
 * 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_result_update_data">ONEX_RESULT_UPDATE_DATA</a> contains information on a status change to 802.1X authentication. The <b>ONEX_RESULT_UPDATE_DATA</b> structure is returned  when  the <b>NotificationSource</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure is <b>WLAN_NOTIFICATION_SOURCE_ONEX</b>  and the <b>NotificationCode</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure for received notification  is <b>OneXNotificationTypeResultUpdate</b>. For this notification, the <b>pData</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure points to an  <b>ONEX_RESULT_UPDATE_DATA</b> structure that contains information on the 802.1X authentication status change. 
 * 
 * If the <b>fOneXAuthParams</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_result_update_data">ONEX_RESULT_UPDATE_DATA</a> structure is set, then the  <b>authParams</b> member of the <b>ONEX_RESULT_UPDATE_DATA</b> structure contains an <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_variable_blob">ONEX_VARIABLE_BLOB</a> structure with an <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_auth_params">ONEX_AUTH_PARAMS</a> structure embedded starting at the <b>dwOffset</b> member of the  <b>ONEX_VARIABLE_BLOB</b>. This <b>ONEX_AUTH_PARAMS</b>  structure that contains a value from the <b>ONEX_AUTH_IDENTITY</b> enumeration in the <b>authIdentity</b> member.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dot1x/ne-dot1x-onex_auth_identity
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class ONEX_AUTH_IDENTITY extends Win32Enum{

    /**
     * No identity is specified in the profile used for 802.1X authentication.
     * @type {Integer (Int32)}
     */
    static OneXAuthIdentityNone => 0

    /**
     * The identity of the local machine account is used for 802.1X authentication.
     * @type {Integer (Int32)}
     */
    static OneXAuthIdentityMachine => 1

    /**
     * The identity of the logged-on user is used for 802.1X authentication.
     * @type {Integer (Int32)}
     */
    static OneXAuthIdentityUser => 2

    /**
     * The identity of an explicit user as specified in the profile is used for 802.1X authentication. This value is used when performing single signon or when credentials are saved with the profile.
     * @type {Integer (Int32)}
     */
    static OneXAuthIdentityExplicitUser => 3

    /**
     * The identity of the Guest account as specified in the profile is used for 802.1X authentication.
     * @type {Integer (Int32)}
     */
    static OneXAuthIdentityGuest => 4

    /**
     * The identity is not valid as specified in the profile used for 802.1X authentication.
     * @type {Integer (Int32)}
     */
    static OneXAuthIdentityInvalid => 5
}
