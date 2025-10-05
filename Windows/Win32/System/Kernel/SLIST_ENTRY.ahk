#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an item in a singly linked list. (SLIST_ENTRY)
 * @remarks
 * All list items must be aligned on a  <b>MEMORY_ALLOCATION_ALIGNMENT</b> boundary. Unaligned items can cause unpredictable results. See <b>_aligned_malloc</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-slist_entry
 * @namespace Windows.Win32.System.Kernel
 * @version v4.0.30319
 */
class SLIST_ENTRY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * A pointer to an 
     * <b>SLIST_ENTRY</b> structure that represents the next item in a singly linked list.
     * @type {Pointer<TypeHandle>}
     */
    Next {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
