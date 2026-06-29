#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMAGE_RUNTIME_FUNCTION_ENTRY.ahk" { IMAGE_RUNTIME_FUNCTION_ENTRY }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @architecture X64
 */
export default struct UNWIND_HISTORY_TABLE_ENTRY {
    #StructPack 8

    ImageBase : IntPtr

    FunctionEntry : IMAGE_RUNTIME_FUNCTION_ENTRY.Ptr

}
