#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WIA_MICR_INFO.ahk" { WIA_MICR_INFO }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct WIA_MICR {
    #StructPack 4

    Tag : UInt32

    Version : UInt32

    Size : UInt32

    Placeholder : Int8

    Reserved : UInt16

    Count : UInt32

    Micr : WIA_MICR_INFO[1]

}
