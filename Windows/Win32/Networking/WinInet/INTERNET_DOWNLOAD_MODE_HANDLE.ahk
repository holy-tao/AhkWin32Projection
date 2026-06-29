#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct INTERNET_DOWNLOAD_MODE_HANDLE {
    #StructPack 8

    pcwszFileName : PWSTR

    phFile : HANDLE.Ptr

}
