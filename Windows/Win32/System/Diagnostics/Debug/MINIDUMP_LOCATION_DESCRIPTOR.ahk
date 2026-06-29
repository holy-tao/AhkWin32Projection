#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information describing the location of a data stream within a minidump file. (MINIDUMP_LOCATION_DESCRIPTOR)
 * @remarks
 * In this context, a data stream refers to a block of data within a minidump file.
 * 
 * This structure uses 32-bit locations for RVAs in the first 4GB and 64-bit locations are used for larger RVAs. The <b>MINIDUMP_LOCATION_DESCRIPTOR64</b> structure is defined as follows.
 * 
 * 
 * ```cpp
 * 
 * typedef struct _MINIDUMP_LOCATION_DESCRIPTOR64 {
 *   ULONG64 DataSize;
 *   RVA64 Rva;
 * } MINIDUMP_LOCATION_DESCRIPTOR64;
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_LOCATION_DESCRIPTOR {
    #StructPack 4

    /**
     * The size of the data stream, in bytes.
     */
    DataSize : UInt32

    /**
     * The relative virtual address (RVA) of the data. This is the byte offset of the data stream from the beginning of the minidump file.
     */
    Rva : UInt32

}
