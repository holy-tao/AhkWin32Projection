#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a lowest and highest base address and alignment as part of an extended parameter to a function that manages virtual memory.
 * @remarks
 * 
  * Specifying a <b>MEM_ADDRESS_REQUIREMENTS</b> structure with all fields set to 0 is the same as not specifying one at all.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-mem_address_requirements
 * @namespace Windows.Win32.System.Memory
 * @version v4.0.30319
 */
class MEM_ADDRESS_REQUIREMENTS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Specifies the lowest acceptable address. Calling <a href=" and specifying <b>NULL</b> for <i>LowestStartingAddress</i>, and specifying <b>NULL</b> for <i>LowestStartingAddress</i>, gives the same behavior as calling <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a>/<a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a>.
     * @type {Pointer<Void>}
     */
    LowestStartingAddress {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Specifies the highest acceptable address (inclusive). This address must not exceed <b>lpMaximumApplicationAddress</b> returned by <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsysteminfo">GetSystemInfo</a>. Calling <a href=" and specifying <b>NULL</b> for <i>LowestStartingAddress</i>, and specifying <b>NULL</b> for <i>HighestEndingAddress</i>, gives the same behavior as calling <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a>/<a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a>.
     * @type {Pointer<Void>}
     */
    HighestEndingAddress {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies power-of-2 alignment. Specifying 0 aligns the returned address on the system allocation granularity.
     * @type {Pointer}
     */
    Alignment {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
