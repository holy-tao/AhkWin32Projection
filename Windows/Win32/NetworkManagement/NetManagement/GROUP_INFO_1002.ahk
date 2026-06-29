#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The GROUP_INFO_1002 structure contains a comment to associate with a global group.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-group_info_1002
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct GROUP_INFO_1002 {
    #StructPack 8

    /**
     * Pointer to a null-terminated Unicode character string that contains a remark to associate with the global group. This member can be a null string. The comment can contain MAXCOMMENTSZ characters.
     */
    grpi1002_comment : PWSTR

}
