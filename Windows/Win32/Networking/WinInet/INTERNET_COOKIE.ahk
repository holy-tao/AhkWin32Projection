#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct INTERNET_COOKIE {
    #StructPack 8

    cbSize : UInt32 := this.Size

    pszName : PSTR

    pszData : PSTR

    pszDomain : PSTR

    pszPath : PSTR

    pftExpires : FILETIME.Ptr

    dwFlags : UInt32

    pszUrl : PSTR

    pszP3PPolicy : PSTR

}
