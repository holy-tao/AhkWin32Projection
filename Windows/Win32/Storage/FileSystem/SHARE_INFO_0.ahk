#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains the name of the shared resource.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-share_info_0
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct SHARE_INFO_0 {
    #StructPack 8

    /**
     * Pointer to a Unicode string specifying the share name of a resource.
     */
    shi0_netname : PWSTR

}
