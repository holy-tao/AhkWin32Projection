#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/console/key-event-record-str
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class KEY_EVENT_RECORD extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    bKeyDown {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    wRepeatCount {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    wVirtualKeyCode {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    wVirtualScanCode {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    UnicodeChar {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * @type {CHAR}
     */
    AsciiChar {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    dwControlKeyState {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
