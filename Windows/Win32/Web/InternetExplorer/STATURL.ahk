#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct STATURL {
    #StructPack 8

    cbSize : UInt32 := this.Size

    pwcsUrl : PWSTR

    pwcsTitle : PWSTR

    ftLastVisited : FILETIME

    ftLastUpdated : FILETIME

    ftExpires : FILETIME

    dwFlags : UInt32

}
