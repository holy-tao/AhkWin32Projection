#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains a comment associated with the shared resource.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-share_info_1004
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct SHARE_INFO_1004 {
    #StructPack 8

    /**
     * Pointer to a Unicode string that contains an optional comment about the shared resource.
     */
    shi1004_remark : PWSTR

}
