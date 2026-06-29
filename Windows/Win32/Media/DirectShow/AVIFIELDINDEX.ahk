#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AVIFIELDINDEX {
    #StructPack 8


    struct _avifieldindex_entry {
        dwOffset : UInt32

        dwSize : UInt32

        dwOffsetField2 : UInt32

    }

    fcc : UInt32

    cb : UInt32

    wLongsPerEntry : UInt16

    bIndexSubType : Int8

    bIndexType : Int8

    nEntriesInUse : UInt32

    dwChunkId : UInt32

    qwBaseOffset : Int64

    dwReserved3 : UInt32

    aIndex : AVIFIELDINDEX._avifieldindex_entry[1]

}
