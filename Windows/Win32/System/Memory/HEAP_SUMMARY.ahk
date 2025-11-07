#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//heapapi/ns-heapapi-heap_summary
 * @namespace Windows.Win32.System.Memory
 * @version v4.0.30319
 */
class HEAP_SUMMARY extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The size of this data structure, in bytes. Set this member to sizeof(HEAP_SUMMARY).
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of the allocated memory.
     * @type {Pointer}
     */
    cbAllocated {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The size of the committed memory.
     * @type {Pointer}
     */
    cbCommitted {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The size of the reserved memory.
     * @type {Pointer}
     */
    cbReserved {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The size of the maximum reserved memory.
     * @type {Pointer}
     */
    cbMaxReserve {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
