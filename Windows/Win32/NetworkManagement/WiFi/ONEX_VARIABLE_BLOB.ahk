#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Is used as a member of other 802.1X authentication structures to contain variable-sized members.
 * @remarks
 * The <b>ONEX_VARIABLE_BLOB</b> structure is used by the 802.1X module, a new wireless configuration component supported on Windows Vista and  later.  
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_result_update_data">ONEX_RESULT_UPDATE_DATA</a> contains information on a status change to 802.1X authentication. The <b>ONEX_RESULT_UPDATE_DATA</b> structure is returned  when  the <b>NotificationSource</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure is <b>WLAN_NOTIFICATION_SOURCE_ONEX</b>  and the <b>NotificationCode</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure for received notification  is <b>OneXNotificationTypeResultUpdate</b>. For this notification, the <b>pData</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure points to an  <b>ONEX_RESULT_UPDATE_DATA</b> structure that contains information on the 802.1X authentication status change. 
 * 
 * A number of the nested structure members in the <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_result_update_data">ONEX_RESULT_UPDATE_DATA</a> structure contains members of the <b>ONEX_VARIABLE_BLOB</b> type.
 * @see https://learn.microsoft.com/windows/win32/api/dot1x/ns-dot1x-onex_variable_blob
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class ONEX_VARIABLE_BLOB extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The size, in bytes, of this <b>ONEX_VARIABLE_BLOB</b> structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The offset, in bytes, from the beginning of the containing outer structure (where the <b>ONEX_VARIABLE_BLOB</b> structure is a  member) to the data contained in the <b>ONEX_VARIABLE_BLOB</b> structure.
     * @type {Integer}
     */
    dwOffset {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
