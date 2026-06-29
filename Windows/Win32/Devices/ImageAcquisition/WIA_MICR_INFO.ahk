#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct WIA_MICR_INFO {
    #StructPack 4

    Size : UInt32

    Page : UInt32

    Length : UInt32

    Text : WCHAR[1]

}
