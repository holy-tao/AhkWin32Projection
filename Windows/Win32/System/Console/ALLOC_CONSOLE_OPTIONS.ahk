#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ALLOC_CONSOLE_MODE.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.System.Console
 */
class ALLOC_CONSOLE_OPTIONS extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {ALLOC_CONSOLE_MODE}
     */
    mode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {BOOL}
     */
    useShowWindow {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    showWindow {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }
}
