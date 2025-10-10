#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a range of item IDs.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/ns-winsync-sync_range
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class SYNC_RANGE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The closed lower bound of item IDs that are contained in the range.
     * @type {Pointer<Byte>}
     */
    pbClosedLowerBound {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The closed upper bound of item IDs that are contained in the range.
     * @type {Pointer<Byte>}
     */
    pbClosedUpperBound {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
