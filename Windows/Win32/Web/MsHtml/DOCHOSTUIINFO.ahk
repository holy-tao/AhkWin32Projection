#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct DOCHOSTUIINFO {
    #StructPack 8

    cbSize : UInt32 := this.Size

    dwFlags : UInt32

    dwDoubleClick : UInt32

    pchHostCss : PWSTR

    pchHostNS : PWSTR

}
