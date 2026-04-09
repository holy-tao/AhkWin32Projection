#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\ETW_CONTEXT_REGISTER_TYPES.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
class TRACE_CONTEXT_REGISTER_INFO extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {ETW_CONTEXT_REGISTER_TYPES}
     */
    RegisterTypes {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
