#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WIA_BARCODE_INFO.ahk" { WIA_BARCODE_INFO }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct WIA_BARCODES {
    #StructPack 4

    Tag : UInt32

    Version : UInt32

    Size : UInt32

    Count : UInt32

    Barcodes : WIA_BARCODE_INFO[1]

}
