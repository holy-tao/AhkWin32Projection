#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Security\SID_NAME_USE.ahk" { SID_NAME_USE }
#Import "..\..\Security\PSID.ahk" { PSID }

/**
 * The LOCALGROUP_MEMBERS_INFO_1 structure contains the security identifier (SID) and account information associated with the member of a local group.
 * @remarks
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-localgroup_members_info_1
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct LOCALGROUP_MEMBERS_INFO_1 {
    #StructPack 8

    /**
     * Type: <b>PSID</b>
     * 
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that contains the security identifier (SID) of an account that is a member of this local group member. The account can be a user account or a global group account.
     */
    lgrmi1_sid : PSID

    /**
     * Type: <b>SID_NAME_USE</b>
     * 
     * The account type associated with the security identifier specified in the <b>lgrmi1_sid</b>  member. The following values are valid. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SidTypeUser"></a><a id="sidtypeuser"></a><a id="SIDTYPEUSER"></a><dl>
     * <dt><b>SidTypeUser</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The account is a user account.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SidTypeGroup"></a><a id="sidtypegroup"></a><a id="SIDTYPEGROUP"></a><dl>
     * <dt><b>SidTypeGroup</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The account is a global group account.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SidTypeWellKnownGroup"></a><a id="sidtypewellknowngroup"></a><a id="SIDTYPEWELLKNOWNGROUP"></a><dl>
     * <dt><b>SidTypeWellKnownGroup</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The account is a well-known group account (such as Everyone). For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/well-known-sids">Well-Known SIDs</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SidTypeDeletedAccount"></a><a id="sidtypedeletedaccount"></a><a id="SIDTYPEDELETEDACCOUNT"></a><dl>
     * <dt><b>SidTypeDeletedAccount</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The account has been deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SidTypeUnknown"></a><a id="sidtypeunknown"></a><a id="SIDTYPEUNKNOWN"></a><dl>
     * <dt><b>SidTypeUnknown</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The account type cannot be determined.
     * 
     * </td>
     * </tr>
     * </table>
     */
    lgrmi1_sidusage : SID_NAME_USE

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to the account name of the local group member identified by the <b>lgrmi1_sid</b> member. The <b>lgrmi1_name</b> member does not include the domain name. For more information, see the following Remarks section.
     */
    lgrmi1_name : PWSTR

}
