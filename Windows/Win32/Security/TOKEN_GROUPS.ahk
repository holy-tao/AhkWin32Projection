#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SID_AND_ATTRIBUTES.ahk" { SID_AND_ATTRIBUTES }
#Import ".\PSID.ahk" { PSID }

/**
 * Contains information about the group security identifiers (SIDs) in an access token.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_groups
 * @namespace Windows.Win32.Security
 */
export default struct TOKEN_GROUPS {
    #StructPack 8

    /**
     * Specifies the number of groups in the access token.
     */
    GroupCount : UInt32

    /**
     * Specifies an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes">SID_AND_ATTRIBUTES</a> structures that contain a set of SIDs and corresponding attributes. 
     * 
     * 
     * 
     * 
     * The <b>Attributes</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes">SID_AND_ATTRIBUTES</a> structures can have the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SE_GROUP_ENABLED"></a><a id="se_group_enabled"></a><dl>
     * <dt><b>SE_GROUP_ENABLED</b></dt>
     * <dt>0x00000004L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SID is enabled for access checks. When the system performs an access check, it checks for access-allowed and access-denied <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control entries</a> (ACEs) that apply to the SID. 
     * 
     * 
     * 
     * 
     * A SID without this attribute is ignored during an access check unless the SE_GROUP_USE_FOR_DENY_ONLY attribute is set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SE_GROUP_ENABLED_BY_DEFAULT"></a><a id="se_group_enabled_by_default"></a><dl>
     * <dt><b>SE_GROUP_ENABLED_BY_DEFAULT</b></dt>
     * <dt>0x00000002L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SID is enabled by default.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SE_GROUP_INTEGRITY"></a><a id="se_group_integrity"></a><dl>
     * <dt><b>SE_GROUP_INTEGRITY</b></dt>
     * <dt>0x00000020L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SID is a mandatory integrity SID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SE_GROUP_INTEGRITY_ENABLED"></a><a id="se_group_integrity_enabled"></a><dl>
     * <dt><b>SE_GROUP_INTEGRITY_ENABLED</b></dt>
     * <dt>0x00000040L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SID is enabled for mandatory integrity checks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SE_GROUP_LOGON_ID"></a><a id="se_group_logon_id"></a><dl>
     * <dt><b>SE_GROUP_LOGON_ID</b></dt>
     * <dt>0xC0000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SID is a logon SID that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a> associated with an access token.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SE_GROUP_MANDATORY"></a><a id="se_group_mandatory"></a><dl>
     * <dt><b>SE_GROUP_MANDATORY</b></dt>
     * <dt>0x00000001L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SID cannot have the SE_GROUP_ENABLED attribute cleared by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-adjusttokengroups">AdjustTokenGroups</a> function. However, you can use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-createrestrictedtoken">CreateRestrictedToken</a> function to convert a mandatory SID to a deny-only SID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SE_GROUP_OWNER"></a><a id="se_group_owner"></a><dl>
     * <dt><b>SE_GROUP_OWNER</b></dt>
     * <dt>0x00000008L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SID identifies a group account for which the user of the token is the owner of the group, or the SID can be assigned as the owner of the token or objects.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SE_GROUP_RESOURCE"></a><a id="se_group_resource"></a><dl>
     * <dt><b>SE_GROUP_RESOURCE</b></dt>
     * <dt>0x20000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SID identifies a domain-local group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SE_GROUP_USE_FOR_DENY_ONLY"></a><a id="se_group_use_for_deny_only"></a><dl>
     * <dt><b>SE_GROUP_USE_FOR_DENY_ONLY</b></dt>
     * <dt>0x00000010L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SID is a deny-only SID in a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/restricted-tokens">restricted token</a>. When the system performs an access check, it checks for access-denied ACEs that apply to the SID; it ignores access-allowed ACEs for the SID. 
     * 
     * 
     * 
     * 
     * If this attribute is set, SE_GROUP_ENABLED is not set, and the SID cannot be reenabled.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Groups : SID_AND_ATTRIBUTES[1]

}
