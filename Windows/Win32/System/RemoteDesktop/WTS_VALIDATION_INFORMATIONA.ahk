#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PRODUCT_INFOA.ahk" { PRODUCT_INFOA }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @charset ANSI
 */
export default struct WTS_VALIDATION_INFORMATIONA {
    #StructPack 4

    ProductInfo : PRODUCT_INFOA

    License : Int8[16384]

    LicenseLength : UInt32

    HardwareID : Int8[20]

    HardwareIDLength : UInt32

}
