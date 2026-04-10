#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\IMAGE_RUNTIME_FUNCTION_ENTRY.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @architecture X64
 */
class UNWIND_HISTORY_TABLE_ENTRY extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    ImageBase {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<IMAGE_RUNTIME_FUNCTION_ENTRY>}
     */
    FunctionEntry {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
