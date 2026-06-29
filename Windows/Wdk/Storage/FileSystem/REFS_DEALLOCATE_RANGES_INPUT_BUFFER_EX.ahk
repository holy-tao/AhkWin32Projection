#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\REFS_DEALLOCATE_RANGES_ALLOCATOR.ahk" { REFS_DEALLOCATE_RANGES_ALLOCATOR }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct REFS_DEALLOCATE_RANGES_INPUT_BUFFER_EX {
    #StructPack 8

    RangeCount : UInt32

    Allocator : REFS_DEALLOCATE_RANGES_ALLOCATOR

    StreamReserveUpdateCount : Int64

    OffsetToRanges : UInt32

    OffsetToLeakCounts : UInt32

    Reserved : Int64[2]

}
