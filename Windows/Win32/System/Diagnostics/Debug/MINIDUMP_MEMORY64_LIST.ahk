#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MINIDUMP_MEMORY_DESCRIPTOR64.ahk

/**
 * Contains a list of memory ranges.M
 * @remarks
 * The <b>MINIDUMP_MEMORY64_LIST</b> structure is defined as follows. It is used for full-memory minidumps.
  * 
  * 
  * ```cpp
  * 
  * typedef struct _MINIDUMP_MEMORY64_LIST {
  *     ULONG64 NumberOfMemoryRanges;
  *     RVA64 BaseRva;
  *     MINIDUMP_MEMORY_DESCRIPTOR64 MemoryRanges [0];
  * } MINIDUMP_MEMORY64_LIST, *PMINIDUMP_MEMORY64_LIST;
  * ```
  * 
  * 
  * Note that <b>BaseRva</b> is the overall base RVA for the memory list. To locate the data for a particular descriptor, start at <b>BaseRva</b> and increment by the size of a descriptor until you reach the descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory64_list
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_MEMORY64_LIST extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The number of structures in the <b>MemoryRanges</b> array.
     * @type {Integer}
     */
    NumberOfMemoryRanges {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    BaseRva {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory_descriptor">MINIDUMP_MEMORY_DESCRIPTOR</a> structures.
     * @type {Array<MINIDUMP_MEMORY_DESCRIPTOR64>}
     */
    MemoryRanges{
        get {
            if(!this.HasProp("__MemoryRangesProxyArray"))
                this.__MemoryRangesProxyArray := Win32FixedArray(this.ptr + 16, 1, MINIDUMP_MEMORY_DESCRIPTOR64, "")
            return this.__MemoryRangesProxyArray
        }
    }
}
