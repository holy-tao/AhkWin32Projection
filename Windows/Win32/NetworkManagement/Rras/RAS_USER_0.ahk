#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RAS_USER_0 structure contains information for a particular Remote Access Service user.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ras_user_0
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RAS_USER_0 extends Win32Struct
{
    static sizeof => 260

    static packingSize => 2

    /**
     * Specifies the types of remote access privilege available to the RAS user. 
     * 
     * 
     * 
     * 
     * The following remote access privilege constants are defined in Mprapi.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASPRIV_DialinPrivilege"></a><a id="raspriv_dialinprivilege"></a><a id="RASPRIV_DIALINPRIVILEGE"></a><dl>
     * <dt><b>RASPRIV_DialinPrivilege</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user has permission to dial in to the RAS server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASPRIV_NoCallback"></a><a id="raspriv_nocallback"></a><a id="RASPRIV_NOCALLBACK"></a><dl>
     * <dt><b>RASPRIV_NoCallback</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The RAS server will not call back the user to establish a connection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASPRIV_AdminSetCallback"></a><a id="raspriv_adminsetcallback"></a><a id="RASPRIV_ADMINSETCALLBACK"></a><dl>
     * <dt><b>RASPRIV_AdminSetCallback</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When the user calls, the RAS server hangs up and calls a preset call-back phone number stored in the user account database. The <b>wszPhoneNumber</b> member of the 
     * <b>RAS_USER_0</b> structure contains the user's call-back phone number.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASPRIV_CallerSetCallback"></a><a id="raspriv_callersetcallback"></a><a id="RASPRIV_CALLERSETCALLBACK"></a><dl>
     * <dt><b>RASPRIV_CallerSetCallback</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When the user calls, the RAS server provides the option of specifying a call-back phone number. The user can also choose to connect immediately without a call back. The <b>wszPhoneNumber</b> member contains a default number that the user can override.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * 
     * 
     * Use the following constant as a mask to isolate the call-back privilege. (This constant is also defined in Mprapi.h.)
     * 
     * RASPRIV_CallbackType
     * @type {Integer}
     */
    bfPrivilege {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Pointer to a Unicode string containing the phone number at which the RAS user should be called back.
     * @type {String}
     */
    wszPhoneNumber {
        get => StrGet(this.ptr + 2, 128, "UTF-16")
        set => StrPut(value, this.ptr + 2, 128, "UTF-16")
    }
}
