#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USER_MODALS_INFO_1 structure contains logon server and domain controller information.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_modals_info_1
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_MODALS_INFO_1 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the role of the logon server. The following values are defined. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UAS_ROLE_STANDALONE"></a><a id="uas_role_standalone"></a><dl>
     * <dt><b>UAS_ROLE_STANDALONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The logon server is a stand-alone server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UAS_ROLE_MEMBER"></a><a id="uas_role_member"></a><dl>
     * <dt><b>UAS_ROLE_MEMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The logon server is a member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UAS_ROLE_BACKUP"></a><a id="uas_role_backup"></a><dl>
     * <dt><b>UAS_ROLE_BACKUP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The logon server is a backup.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UAS_ROLE_PRIMARY"></a><a id="uas_role_primary"></a><dl>
     * <dt><b>UAS_ROLE_PRIMARY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The logon server is a domain controller.
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
     * If the Netlogon service is not being used, the element should be set to UAS_ROLE_STANDALONE.
     * @type {Integer}
     */
    usrmod1_role {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a Unicode string that specifies the name of the domain controller that stores the primary copy of the database for the user account manager.
     * @type {Pointer<PWSTR>}
     */
    usrmod1_primary {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
