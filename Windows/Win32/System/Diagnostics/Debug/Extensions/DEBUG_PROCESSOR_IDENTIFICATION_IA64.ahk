#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_PROCESSOR_IDENTIFICATION_IA64 {
    #StructPack 4

    Model : UInt32

    Revision : UInt32

    Family : UInt32

    ArchRev : UInt32

    VendorString : CHAR[16]

}
