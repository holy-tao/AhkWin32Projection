#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents information about call targets for Control Flow Guard (CFG).
 * @see https://learn.microsoft.com/windows/win32/Memory/-cfg-call-target-info
 * @namespace Windows.Win32.System.Memory
 * @version v4.0.30319
 */
class CFG_CALL_TARGET_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Offset relative to a provided (start) virtual address. This offset should be 16 byte aligned.
     * @type {Pointer}
     */
    Offset {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Flags describing the operation to be performed on the address. If **CFG\_CALL\_TARGET\_VALID** is set, then the address will be marked valid for CFG. Otherwise, it will be marked an invalid call target.
     * @type {Pointer}
     */
    Flags {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
