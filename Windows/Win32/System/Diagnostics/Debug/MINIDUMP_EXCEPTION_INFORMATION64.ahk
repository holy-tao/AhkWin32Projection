#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class MINIDUMP_EXCEPTION_INFORMATION64 extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ThreadId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ExceptionRecord {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ContextRecord {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {BOOL}
     */
    ClientPointers {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
