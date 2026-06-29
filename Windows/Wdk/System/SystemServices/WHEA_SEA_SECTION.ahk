#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_SEA_SECTION {
    #StructPack 8

    Esr : UInt32

    Far : Int64

    Par : Int64

    WasKernel : BOOLEAN

}
