#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies an index for the ASF indexer object.
 * @remarks
 * The index object of an ASF file can contain a number of distinct indexes. Each index is identified by the type of index and the stream number. No ASF index object can contain more than one index for a particular combination of stream number and index type.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/ns-wmcontainer-asf_index_identifier
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ASF_INDEX_IDENTIFIER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The type of index. Currently this value must be GUID_NULL, which specifies time-based indexing.
     * @type {Pointer<Guid>}
     */
    guidIndexType {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The stream number to which this structure applies.
     * @type {Integer}
     */
    wStreamNumber {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }
}
