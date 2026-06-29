#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PRODUCT_INFOW.ahk" { PRODUCT_INFOW }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @charset Unicode
 */
export default struct WTS_VALIDATION_INFORMATIONW {
    #StructPack 4

    ProductInfo : PRODUCT_INFOW

    License : Int8[16384]

    LicenseLength : UInt32

    HardwareID : Int8[20]

    HardwareIDLength : UInt32

}
