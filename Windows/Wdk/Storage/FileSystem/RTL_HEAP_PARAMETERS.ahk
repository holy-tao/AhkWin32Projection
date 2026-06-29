#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct RTL_HEAP_PARAMETERS {
    #StructPack 8

    Length : UInt32

    SegmentReserve : IntPtr

    SegmentCommit : IntPtr

    DeCommitFreeBlockThreshold : IntPtr

    DeCommitTotalFreeThreshold : IntPtr

    MaximumAllocationSize : IntPtr

    VirtualMemoryThreshold : IntPtr

    InitialCommit : IntPtr

    InitialReserve : IntPtr

    CommitRoutine : IntPtr

    Reserved : IntPtr[2]

}
