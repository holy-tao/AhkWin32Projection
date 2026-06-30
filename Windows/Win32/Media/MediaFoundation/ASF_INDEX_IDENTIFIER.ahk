#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Specifies an index for the ASF indexer object.
 * @remarks
 * The index object of an ASF file can contain a number of distinct indexes. Each index is identified by the type of index and the stream number. No ASF index object can contain more than one index for a particular combination of stream number and index type.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/ns-wmcontainer-asf_index_identifier
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class ASF_INDEX_IDENTIFIER extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * The type of index. Currently this value must be GUID_NULL, which specifies time-based indexing.
     * @type {Guid}
     */
    guidIndexType {
        get {
            if(!this.HasProp("__guidIndexType"))
                this.__guidIndexType := Guid(0, this)
            return this.__guidIndexType
        }
    }

    /**
     * The stream number to which this structure applies.
     * @type {Integer}
     */
    wStreamNumber {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }
}
