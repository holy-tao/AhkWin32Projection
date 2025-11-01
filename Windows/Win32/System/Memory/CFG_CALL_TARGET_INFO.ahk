#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/Memory/-cfg-call-target-info
 * @namespace Windows.Win32.System.Memory
 * @version v4.0.30319
 */
class CFG_CALL_TARGET_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Offset {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    Flags {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
