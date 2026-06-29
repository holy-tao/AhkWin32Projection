#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains an AVI 2.0 super index (index of indexes).
 * @remarks
 * For more information, see the <i>OpenDML AVI File Format Extensions</i>, published by the OpenDML AVI M-JPEG File Format Subcommittee. (This resource may not be available in some languages 
 * 
 * and countries.)
 * @see https://learn.microsoft.com/windows/win32/api/aviriff/ns-aviriff-avisuperindex
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AVISUPERINDEX {
    #StructPack 8


    struct _avisuperindex_entry {
        qwOffset : Int64

        dwSize : UInt32

        dwDuration : UInt32

    }

    /**
     * A <b>FOURCC</b> code. The value must be 'indx'.
     */
    fcc : UInt32

    /**
     * The size of the structure, not including the initial 8 bytes.
     */
    cb : UInt32

    /**
     * The size of each index entry, in 4-byte units. The value must be 4.
     */
    wLongsPerEntry : UInt16

    /**
     * The index subtype. The value must be zero or <b>AVI_INDEX_SUB_2FIELD</b>.
     */
    bIndexSubType : Int8

    /**
     * The index type. The value must be <b>AVI_INDEX_OF_INDEXES</b>.
     */
    bIndexType : Int8

    /**
     * The number of valid entries in the <b>adwIndex</b> array.
     */
    nEntriesInUse : UInt32

    /**
     * A <b>FOURCC</b> that identifies the object that is indexed.
     */
    dwChunkId : UInt32

    /**
     * Reserved. Set the array elements to zero.
     */
    dwReserved : UInt32[3]

    /**
     * An array of structures that contain the following members. The number of elements in the array is calculated from the value of <b>cb</b>.
     */
    aIndex : AVISUPERINDEX._avisuperindex_entry[1022]

}
