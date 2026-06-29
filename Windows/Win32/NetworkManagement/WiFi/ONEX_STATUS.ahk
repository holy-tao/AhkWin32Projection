#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ONEX_AUTH_STATUS.ahk" { ONEX_AUTH_STATUS }

/**
 * Contains the current 802.1X authentication status.
 * @remarks
 * The <b>ONEX_STATUS</b> structure is used by the 802.1X module, a new wireless configuration component supported on Windows Vista and  later.  
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_result_update_data">ONEX_RESULT_UPDATE_DATA</a> contains information on a status change to 802.1X authentication. The <b>ONEX_RESULT_UPDATE_DATA</b> structure is returned  when  the <b>NotificationSource</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure is <b>WLAN_NOTIFICATION_SOURCE_ONEX</b>  and the <b>NotificationCode</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure for received notification  is <b>OneXNotificationTypeResultUpdate</b>. For this notification, the <b>pData</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure points to an  <b>ONEX_RESULT_UPDATE_DATA</b> structure that contains information on the 802.1X authentication status change. 
 * 
 * The <b>oneXStatus</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_result_update_data">ONEX_RESULT_UPDATE_DATA</a> structure contains an <b>ONEX_STATUS</b> structure.
 * @see https://learn.microsoft.com/windows/win32/api/dot1x/ns-dot1x-onex_status
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct ONEX_STATUS {
    #StructPack 4

    /**
     * The current status of the 802.1X authentication process. Any error that may have occurred during authentication is indicated below by the value of the <b>dwReason</b> and <b>dwError</b> members of the <b>ONEX_STATUS</b> structure. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ne-dot1x-onex_auth_status">ONEX_AUTH_STATUS</a> enumeration.
     */
    authStatus : ONEX_AUTH_STATUS

    /**
     * If an error occurred during 802.1X authentication, this member contains the reason for the error specified as a value from the <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ne-dot1x-onex_reason_code">ONEX_REASON_CODE</a> enumeration. This member is normally <b>ONEX_REASON_CODE_SUCCESS</b> 
     *  when 802.1X authentication is successful and no error occurs.
     */
    dwReason : UInt32

    /**
     * If an error occurred during 802.1X authentication, this member contains the error. This member is normally NO_ERROR, except when an EAPHost error occurs.
     */
    dwError : UInt32

}
