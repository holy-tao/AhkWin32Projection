#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class MINIDUMP_VM_QUERY_CALLBACK extends Win32Struct {
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
