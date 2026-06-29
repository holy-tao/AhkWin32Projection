#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Memory
 */
export default struct WIN32_MEMORY_PARTITION_INFORMATION {
    #StructPack 8

    Flags : UInt32

    NumaNode : UInt32

    Channel : UInt32

    NumberOfNumaNodes : UInt32

    ResidentAvailablePages : Int64

    CommittedPages : Int64

    CommitLimit : Int64

    PeakCommitment : Int64

    TotalNumberOfPages : Int64

    AvailablePages : Int64

    ZeroPages : Int64

    FreePages : Int64

    StandbyPages : Int64

    Reserved : Int64[16]

    MaximumCommitLimit : Int64

    Reserved2 : Int64

    PartitionId : UInt32

}
