#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AVISTDINDEX_ENTRY.ahk" { AVISTDINDEX_ENTRY }

/**
 * Contains an AVI 2.0 standard index.
 * @remarks
 * For more information, see the <i>OpenDML AVI File Format Extensions</i>, published by the OpenDML AVI M-JPEG File Format Subcommittee. (This resource may not be available in some languages 
 * 
 * and countries.)
 * @see https://learn.microsoft.com/windows/win32/api/aviriff/ns-aviriff-avistdindex
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AVISTDINDEX {
    #StructPack 8

    /**
     * A <b>FOURCC</b> code. The value is either  'indx' or '<i>nn</i>ix', where <i>nn</i> is the stream number.
     */
    fcc : UInt32

    /**
     * The size of the structure, not including the initial 8 bytes.
     */
    cb : UInt32

    /**
     * The size of each index entry, in 4-byte units. The value must be 2.
     */
    wLongsPerEntry : UInt16

    /**
     * The index subtype. The value must be zero.
     */
    bIndexSubType : Int8

    /**
     * The index type. The value must be <b>AVI_INDEX_OF_CHUNKS</b>.
     */
    bIndexType : Int8

    /**
     * The number of valid entries in the <b>adwIndex</b> array.
     */
    nEntriesInUse : UInt32

    /**
     * A <b>FOURCC</b> that identifies the object that is indexed. This member has the same meaning as the <b>dwChunkId</b>  member of the <a href="https://docs.microsoft.com/previous-versions/ms779634(v=vs.85)">AVIOLDINDEX</a> structure.
     */
    dwChunkId : UInt32

    /**
     * The base offset for the index entries. For each index entry, <b>qwBaseOffset</b> + <b>AVISTDINDEX_ENTRY.dwOffset</b> gives the offset from the start of the file to the data.
     */
    qwBaseOffset : Int64

    /**
     * Reserved. Set to zero.
     */
    dwReserved_3 : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/aviriff/ns-aviriff-avistdindex_entry">AVISTDINDEX_ENTRY</a> structures. The number of elements in the array is calculated from the value of <b>cb</b>.
     */
    aIndex : AVISTDINDEX_ENTRY[2044]

}
