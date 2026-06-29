#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
 */
export default struct USER_OTHER_INFO {
    #StructPack 4

    /**
     * Specifies the error code for the new message in the message log.
     */
    alrtus_errcode : UInt32

    /**
     * Specifies the number (0-9) of consecutive Unicode strings in the message log.
     */
    alrtus_numstrings : UInt32

}
