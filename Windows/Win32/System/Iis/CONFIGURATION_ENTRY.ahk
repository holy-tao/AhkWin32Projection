#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct CONFIGURATION_ENTRY {
    #StructPack 8

    bstrKey : BSTR

    bstrValue : BSTR

}
