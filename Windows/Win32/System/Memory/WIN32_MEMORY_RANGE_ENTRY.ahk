#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a range of memory.
 * @remarks
 * To compile an application that calls this function, define <b>_WIN32_WINNT</b> as 
  *     <b>_WIN32_WINNT_WIN8</b> or higher. For more information, see 
  *     <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * @see https://learn.microsoft.com/windows/win32/api/memoryapi/ns-memoryapi-win32_memory_range_entry
 * @namespace Windows.Win32.System.Memory
 * @version v4.0.30319
 */
class WIN32_MEMORY_RANGE_ENTRY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * 
     * @type {Pointer<Void>}
     */
    VirtualAddress {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * 
     * @type {Pointer}
     */
    NumberOfBytes {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
