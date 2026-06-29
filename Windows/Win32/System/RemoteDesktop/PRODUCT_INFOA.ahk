#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @charset ANSI
 */
export default struct PRODUCT_INFOA {
    #StructPack 1

    CompanyName : CHAR[256]

    ProductID : CHAR[4]

}
