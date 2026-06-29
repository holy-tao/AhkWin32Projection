#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The GROUP_INFO_1 structure contains a global group name and a comment to associate with the group.
 * @remarks
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-group_info_1
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct GROUP_INFO_1 {
    #StructPack 8

    /**
     * Pointer to a null-terminated Unicode character string that specifies the name of the global group. For more information, see the following Remarks section. 
     * 
     * 
     * 
     * 
     * When you call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupsetinfo">NetGroupSetInfo</a> function this member is ignored.
     */
    grpi1_name : PWSTR

    /**
     * Pointer to a null-terminated Unicode character string that specifies a remark associated with the global group. This member can be a null string. The comment can contain MAXCOMMENTSZ characters.
     */
    grpi1_comment : PWSTR

}
