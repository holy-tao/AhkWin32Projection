#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\TIMECODE.ahk" { TIMECODE }
#Import ".\AVITCDLINDEX_ENTRY.ahk" { AVITCDLINDEX_ENTRY }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AVITCDLINDEX {
    #StructPack 8

    fcc : UInt32

    cb : UInt32

    wLongsPerEntry : UInt16

    bIndexSubType : Int8

    bIndexType : Int8

    nEntriesInUse : UInt32

    dwChunkId : UInt32

    dwReserved : UInt32[3]

    aIndex : AVITCDLINDEX_ENTRY[584]

    adwTrailingFill : UInt32[3512]

}
