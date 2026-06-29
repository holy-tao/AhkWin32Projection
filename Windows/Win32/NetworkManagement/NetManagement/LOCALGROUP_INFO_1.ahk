#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The LOCALGROUP_INFO_1 structure contains a local group name and a comment describing the local group.
 * @remarks
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-localgroup_info_1
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct LOCALGROUP_INFO_1 {
    #StructPack 8

    /**
     * Pointer to a Unicode string that specifies a local group name. For more information, see the following Remarks section. 
     * 
     * 
     * 
     * 
     * This member is ignored when you call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netlocalgroupsetinfo">NetLocalGroupSetInfo</a> function.
     */
    lgrpi1_name : PWSTR

    /**
     * Pointer to a Unicode string that contains a remark associated with the local group. This member can be a null string. The comment can have as many as MAXCOMMENTSZ characters.
     */
    lgrpi1_comment : PWSTR

}
