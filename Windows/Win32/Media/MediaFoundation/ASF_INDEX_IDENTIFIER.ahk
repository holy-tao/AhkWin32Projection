#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Specifies an index for the ASF indexer object.
 * @remarks
 * The index object of an ASF file can contain a number of distinct indexes. Each index is identified by the type of index and the stream number. No ASF index object can contain more than one index for a particular combination of stream number and index type.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/ns-wmcontainer-asf_index_identifier
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ASF_INDEX_IDENTIFIER {
    #StructPack 4

    /**
     * The type of index. Currently this value must be GUID_NULL, which specifies time-based indexing.
     */
    guidIndexType : Guid

    /**
     * The stream number to which this structure applies.
     */
    wStreamNumber : UInt16

}
