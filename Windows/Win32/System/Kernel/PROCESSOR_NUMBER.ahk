#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a logical processor in a processor group.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-processor_number
 * @namespace Windows.Win32.System.Kernel
 * @version v4.0.30319
 */
class PROCESSOR_NUMBER extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * The processor group to which the logical processor is assigned.
     * @type {Integer}
     */
    Group {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The number of the logical processor relative to the group.
     * @type {Integer}
     */
    Number {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * This parameter is reserved.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }
}
