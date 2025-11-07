#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LOCALGROUP_MEMBERS_INFO_2 structure contains the security identifier (SID) and account information associated with a local group member.
 * @remarks
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-localgroup_members_info_2
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class LOCALGROUP_MEMBERS_INFO_2 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>PSID</b>
     * 
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that contains the security identifier (SID) of a local group member. The local group member can be a user account or a global group account.
     * @type {PSID}
     */
    lgrmi2_sid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>SID_NAME_USE</b>
     * 
     * The account type associated with the security identifier specified in the <b>lgrmi2_sid</b> member. The following values are valid. 
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
     * @type {Integer}
     */
    lgrmi2_sidusage {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to the account name of the local group member identified by <b>lgrmi2_sid</b>. The <b>lgrmi2_domainandname</b> member includes the domain name and has the form: 
     * 
     * 
     * 
     * 
     * <pre class="syntax" xml:space="preserve"><code>&lt;DomainName&gt;\&lt;AccountName&gt;
     * </code></pre>
     * @type {PWSTR}
     */
    lgrmi2_domainandname {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
