#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MINIDUMP_MEMORY_DESCRIPTOR64.ahk" { MINIDUMP_MEMORY_DESCRIPTOR64 }

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
 */
export default struct MINIDUMP_MEMORY64_LIST {
    #StructPack 8

    /**
     * The number of structures in the <b>MemoryRanges</b> array.
     */
    NumberOfMemoryRanges : Int64

    BaseRva : Int64

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory_descriptor">MINIDUMP_MEMORY_DESCRIPTOR</a> structures.
     */
    MemoryRanges : MINIDUMP_MEMORY_DESCRIPTOR64[1]

}
