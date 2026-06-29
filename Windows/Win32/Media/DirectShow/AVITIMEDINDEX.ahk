#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AVITIMEDINDEX_ENTRY.ahk" { AVITIMEDINDEX_ENTRY }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AVITIMEDINDEX {
    #StructPack 8

    fcc : UInt32

    cb : UInt32

    wLongsPerEntry : UInt16

    bIndexSubType : Int8

    bIndexType : Int8

    nEntriesInUse : UInt32

    dwChunkId : UInt32

    qwBaseOffset : Int64

    dwReserved_3 : UInt32

    aIndex : AVITIMEDINDEX_ENTRY[1362]

    adwTrailingFill : UInt32[2734]

}
