#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\TIMECODE.ahk" { TIMECODE }
#Import ".\TIMECODEDATA.ahk" { TIMECODEDATA }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AVITIMECODEINDEX {
    #StructPack 8

    fcc : UInt32

    cb : UInt32

    wLongsPerEntry : UInt16

    bIndexSubType : Int8

    bIndexType : Int8

    nEntriesInUse : UInt32

    dwChunkId : UInt32

    dwReserved : UInt32[3]

    aIndex : TIMECODEDATA[1022]

}
