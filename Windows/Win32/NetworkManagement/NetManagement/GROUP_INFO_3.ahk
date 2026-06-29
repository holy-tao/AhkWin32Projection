#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Security\PSID.ahk" { PSID }

/**
 * The GROUP_INFO_3 structure contains information about a global group, including name, security identifier (SID), and resource attributes.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-group_info_3
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct GROUP_INFO_3 {
    #StructPack 8

    /**
     * Pointer to a null-terminated Unicode character string that specifies the name of the global group. 
     * 
     * 
     * 
     * 
     * When you call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupsetinfo">NetGroupSetInfo</a> function this member is ignored.
     */
    grpi3_name : PWSTR

    /**
     * Pointer to a null-terminated Unicode character string that contains a remark associated with the global group. This member can be a null string. The comment can contain MAXCOMMENTSZ characters.
     */
    grpi3_comment : PWSTR

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that contains the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-identifiers">security identifier (SID)</a> that uniquely identifies the global group. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> functions ignore this member.
     */
    grpi3_group_sid : PSID

    /**
     * These attributes are hard-coded to SE_GROUP_MANDATORY, SE_GROUP_ENABLED, and SE_GROUP_ENABLED_BY_DEFAULT. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a>.
     */
    grpi3_attributes : UInt32

}
