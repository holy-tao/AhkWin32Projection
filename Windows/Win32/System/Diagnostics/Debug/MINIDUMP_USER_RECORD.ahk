#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MINIDUMP_LOCATION_DESCRIPTOR.ahk" { MINIDUMP_LOCATION_DESCRIPTOR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_USER_RECORD {
    #StructPack 4

    Type : UInt32

    Memory : MINIDUMP_LOCATION_DESCRIPTOR

}
