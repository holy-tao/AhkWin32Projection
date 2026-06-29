#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct WIA_BARCODE_INFO {
    #StructPack 4

    Size : UInt32

    Type : UInt32

    Page : UInt32

    Confidence : UInt32

    XOffset : UInt32

    YOffset : UInt32

    Rotation : UInt32

    Length : UInt32

    Text : WCHAR[1]

}
