#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The GROUP_USERS_INFO_1 structure contains global group member information.
 * @remarks
 * 
  * If you are calling the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupgetusers">NetGroupGetUsers</a> function or the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupsetusers">NetGroupSetUsers</a> function, the <b>grui1_name</b> member contains the name of a user that is a member of the specified group.
  * 
  * If you are calling the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusergetgroups">NetUserGetGroups</a> function or the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetgroups">NetUserSetGroups</a> function, the <b>grui1_name</b> member contains the name of a global group to which the specified user belongs.
  * 
  * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
  * 
  * Windows Vista and later include an addition to the access control security mechanism of Windows that labels processes and other securable objects with an integrity level. Internet-facing programs are at higher risk for exploits than other programs because they download untrustworthy content from unknown sources. Running these programs with fewer permissions, or at a lower integrity level, than other programs reduces the ability of an exploit to modify the system or harm user data files. The SE_GROUP_INTEGRITY and SE_GROUP_INTEGRITY_ENABLED attributes of the <b>grui1_attributes</b> member are used for this purpose.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-group_users_info_1
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class GROUP_USERS_INFO_1 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a null-terminated Unicode character string that specifies a name. For more information, see the Remarks section.
     * @type {PWSTR}
     */
    grui1_name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * A set of attributes for this entry. This member can be a combination of the security group attributes defined in the <i>Winnt.h</i> header file. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SE_GROUP_MANDATORY"></a><a id="se_group_mandatory"></a><dl>
     * <dt><b>SE_GROUP_MANDATORY</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The group is mandatory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SE_GROUP_ENABLED_BY_DEFAULT"></a><a id="se_group_enabled_by_default"></a><dl>
     * <dt><b>SE_GROUP_ENABLED_BY_DEFAULT</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The group is enabled for access checks by default.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SE_GROUP_ENABLED"></a><a id="se_group_enabled"></a><dl>
     * <dt><b>SE_GROUP_ENABLED</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The group is enabled for access checks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SE_GROUP_OWNER"></a><a id="se_group_owner"></a><dl>
     * <dt><b>SE_GROUP_OWNER</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The group identifies a group account for which the user of the token is the owner of the group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SE_GROUP_USE_FOR_DENY_ONLY"></a><a id="se_group_use_for_deny_only"></a><dl>
     * <dt><b>SE_GROUP_USE_FOR_DENY_ONLY</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The group is used for deny only purposes. When this attribute is set, the SE_GROUP_ENABLED attribute must not be set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SE_GROUP_INTEGRITY"></a><a id="se_group_integrity"></a><dl>
     * <dt><b>SE_GROUP_INTEGRITY</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The group is used for integrity. This attribute is available on Windows Vista and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SE_GROUP_INTEGRITY_ENABLED"></a><a id="se_group_integrity_enabled"></a><dl>
     * <dt><b>SE_GROUP_INTEGRITY_ENABLED</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The group is enabled for integrity level. This attribute is available on Windows Vista and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SE_GROUP_LOGON_ID"></a><a id="se_group_logon_id"></a><dl>
     * <dt><b>SE_GROUP_LOGON_ID</b></dt>
     * <dt>0xC0000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The group is used to identify a logon session associated with an access token.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SE_GROUP_RESOURCE"></a><a id="se_group_resource"></a><dl>
     * <dt><b>SE_GROUP_RESOURCE</b></dt>
     * <dt>0x20000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The group identifies a domain-local group.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    grui1_attributes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
