#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct PLUTON_UPGRADE_IMAGEDATA {
    #StructPack 2

    hashAlgID : UInt16

    digestSize : UInt16

    digest : Int8[64]

    fileName : WCHAR[64]

}
