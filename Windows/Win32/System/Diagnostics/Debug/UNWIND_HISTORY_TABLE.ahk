#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY.ahk" { IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY }
#Import ".\UNWIND_HISTORY_TABLE_ENTRY.ahk" { UNWIND_HISTORY_TABLE_ENTRY }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @architecture X64, Arm64
 */
export default struct UNWIND_HISTORY_TABLE {
    #StructPack 8

    Count : UInt32

    LocalHint : Int8

    GlobalHint : Int8

    Search : Int8

    Once : Int8

    LowAddress : IntPtr

    HighAddress : IntPtr

    Entry : UNWIND_HISTORY_TABLE_ENTRY[12]

}
