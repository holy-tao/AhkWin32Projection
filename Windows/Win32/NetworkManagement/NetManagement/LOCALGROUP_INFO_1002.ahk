#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The LOCALGROUP_INFO_1002 structure contains a comment describing a local group.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-localgroup_info_1002
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct LOCALGROUP_INFO_1002 {
    #StructPack 8

    /**
     * Pointer to a Unicode string that specifies a remark associated with the local group. This member can be a null string. The comment can have as many as MAXCOMMENTSZ characters.
     */
    lgrpi1002_comment : PWSTR

}
