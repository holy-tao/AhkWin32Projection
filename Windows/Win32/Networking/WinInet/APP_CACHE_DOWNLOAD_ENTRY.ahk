#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct APP_CACHE_DOWNLOAD_ENTRY {
    #StructPack 8

    pwszUrl : PWSTR

    dwEntryType : UInt32

}
