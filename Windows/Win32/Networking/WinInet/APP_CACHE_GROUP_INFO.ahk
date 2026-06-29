#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct APP_CACHE_GROUP_INFO {
    #StructPack 8

    pwszManifestUrl : PWSTR

    ftLastAccessTime : FILETIME

    ullSize : Int64

}
