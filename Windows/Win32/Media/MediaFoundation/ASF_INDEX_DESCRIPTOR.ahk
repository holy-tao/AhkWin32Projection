#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ASF_INDEX_IDENTIFIER.ahk

/**
 * Describes the indexing configuration for a stream and type of index.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/ns-wmcontainer-asf_index_descriptor
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class ASF_INDEX_DESCRIPTOR extends Win32Struct {
    static sizeof => 92

    static packingSize => 4

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/ns-wmcontainer-asf_index_identifier">ASF_INDEX_IDENTIFIER</a> structure that identifies the stream number and the type of index.
     * @type {ASF_INDEX_IDENTIFIER}
     */
    Identifier {
        get {
            if(!this.HasProp("__Identifier"))
                this.__Identifier := ASF_INDEX_IDENTIFIER(0, this)
            return this.__Identifier
        }
    }

    /**
     * Number of bytes used for each index entry. If the value is MFASFINDEXER_PER_ENTRY_BYTES_DYNAMIC, the index entries have variable size.
     * @type {Integer}
     */
    cPerEntryBytes {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * Optional text description of the index.
     * @type {String}
     */
    szDescription {
        get => StrGet(this.ptr + 22, 31, "UTF-16")
        set => StrPut(value, this.ptr + 22, 31, "UTF-16")
    }

    /**
     * Indexing interval. The units of this value depend on the index type. A value of MFASFINDEXER_NO_FIXED_INTERVAL indicates that there is no fixed indexing interval.
     * @type {Integer}
     */
    dwInterval {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }
}
