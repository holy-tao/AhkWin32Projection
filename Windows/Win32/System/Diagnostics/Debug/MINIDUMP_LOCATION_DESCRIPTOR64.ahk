#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information describing the location of a data stream within a minidump file.M
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
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_LOCATION_DESCRIPTOR64 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size of the data stream, in bytes.
     * @type {Integer}
     */
    DataSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The relative virtual address (RVA) of the data. This is the byte offset of the data stream from the beginning of the minidump file.
     * @type {Integer}
     */
    Rva {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
