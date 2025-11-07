#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MINIDUMP_LOCATION_DESCRIPTOR.ahk

/**
 * Describes a range of memory.
 * @remarks
 * 
 * <b>MINIDUMP_MEMORY_DESCRIPTOR64</b> is used for full-memory minidumps where all of the raw memory is sequential at the end of the minidump. There is no need for individual relative virtual addresses (RVAs), because the RVA is the base RVA plus the sum of the preceding data blocks. The <b>MINIDUMP_MEMORY_DESCRIPTOR64</b> structure is defined as follows. 
 * 
 * 
 * ```cpp
 * 
 * typedef struct _MINIDUMP_MEMORY_DESCRIPTOR64 {
 *     ULONG64 StartOfMemoryRange;
 *     ULONG64 DataSize;
 * } MINIDUMP_MEMORY_DESCRIPTOR64, *PMINIDUMP_MEMORY_DESCRIPTOR64;
 * ```
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//minidumpapiset/ns-minidumpapiset-minidump_memory_descriptor
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_MEMORY_DESCRIPTOR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The starting address of the memory range.
     * @type {Integer}
     */
    StartOfMemoryRange {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor">MINIDUMP_LOCATION_DESCRIPTOR</a> structure.
     * @type {MINIDUMP_LOCATION_DESCRIPTOR}
     */
    Memory{
        get {
            if(!this.HasProp("__Memory"))
                this.__Memory := MINIDUMP_LOCATION_DESCRIPTOR(8, this)
            return this.__Memory
        }
    }
}
