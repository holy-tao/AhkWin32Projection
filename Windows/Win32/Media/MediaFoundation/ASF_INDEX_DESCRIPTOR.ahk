#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ASF_INDEX_IDENTIFIER.ahk" { ASF_INDEX_IDENTIFIER }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Describes the indexing configuration for a stream and type of index.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/ns-wmcontainer-asf_index_descriptor
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ASF_INDEX_DESCRIPTOR {
    #StructPack 4

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/ns-wmcontainer-asf_index_identifier">ASF_INDEX_IDENTIFIER</a> structure that identifies the stream number and the type of index.
     */
    Identifier : ASF_INDEX_IDENTIFIER

    /**
     * Number of bytes used for each index entry. If the value is MFASFINDEXER_PER_ENTRY_BYTES_DYNAMIC, the index entries have variable size.
     */
    cPerEntryBytes : UInt16

    /**
     * Optional text description of the index.
     */
    szDescription : WCHAR[32]

    /**
     * Indexing interval. The units of this value depend on the index type. A value of MFASFINDEXER_NO_FIXED_INTERVAL indicates that there is no fixed indexing interval.
     */
    dwInterval : UInt32

}
