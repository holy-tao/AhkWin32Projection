#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @charset Unicode
 */
export default struct PRODUCT_INFOW {
    #StructPack 2

    CompanyName : WCHAR[256]

    ProductID : WCHAR[4]

}
