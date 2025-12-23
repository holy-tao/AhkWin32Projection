#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USER_OTHER_INFO structure contains user error code information. The NetAlertRaise and NetAlertRaiseEx functions use the USER_OTHER_INFO structure to specify information about an event or condition of interest to a user.
 * @remarks
 * Additional variable-length data follows the 
 * <b>USER_OTHER_INFO</b> structure in the alert message buffer. The information is in the form of contiguous null-terminated character strings, as follows.
 * 
 * <table>
 * <tr>
 * <th>String</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>username</td>
 * <td>The user who created the session.</td>
 * </tr>
 * <tr>
 * <td>computername</td>
 * <td>The computer that created the session.</td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * <div> </div>
 * 
 * 
 * The calling application must allocate and free the memory for all structures and variable-length data in an alert message buffer.
 * 
 * See 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/nf-lmalert-netalertraiseex">NetAlertRaiseEx</a> for a code sample that demonstrates how to raise a user alert.
 * @see https://learn.microsoft.com/windows/win32/api/lmalert/ns-lmalert-user_other_info
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_OTHER_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the error code for the new message in the message log.
     * @type {Integer}
     */
    alrtus_errcode {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the number (0-9) of consecutive Unicode strings in the message log.
     * @type {Integer}
     */
    alrtus_numstrings {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
