#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_PROCESSOR_IDENTIFICATION_AMD64 {
    #StructPack 4

    Family : UInt32

    Model : UInt32

    Stepping : UInt32

    VendorString : CHAR[16]

}
