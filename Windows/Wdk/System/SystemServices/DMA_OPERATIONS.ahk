#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DMA_OPERATIONS {
    #StructPack 8

    Size : UInt32

    PutDmaAdapter : IntPtr

    AllocateCommonBuffer : IntPtr

    FreeCommonBuffer : IntPtr

    AllocateAdapterChannel : IntPtr

    FlushAdapterBuffers : IntPtr

    FreeAdapterChannel : IntPtr

    FreeMapRegisters : IntPtr

    MapTransfer : IntPtr

    GetDmaAlignment : IntPtr

    ReadDmaCounter : IntPtr

    GetScatterGatherList : IntPtr

    PutScatterGatherList : IntPtr

    CalculateScatterGatherList : IntPtr

    BuildScatterGatherList : IntPtr

    BuildMdlFromScatterGatherList : IntPtr

    GetDmaAdapterInfo : IntPtr

    GetDmaTransferInfo : IntPtr

    InitializeDmaTransferContext : IntPtr

    AllocateCommonBufferEx : IntPtr

    AllocateAdapterChannelEx : IntPtr

    ConfigureAdapterChannel : IntPtr

    CancelAdapterChannel : IntPtr

    MapTransferEx : IntPtr

    GetScatterGatherListEx : IntPtr

    BuildScatterGatherListEx : IntPtr

    FlushAdapterBuffersEx : IntPtr

    FreeAdapterObject : IntPtr

    CancelMappedTransfer : IntPtr

    AllocateDomainCommonBuffer : IntPtr

    FlushDmaBuffer : IntPtr

    JoinDmaDomain : IntPtr

    LeaveDmaDomain : IntPtr

    GetDmaDomain : IntPtr

    AllocateCommonBufferWithBounds : IntPtr

    AllocateCommonBufferVector : IntPtr

    GetCommonBufferFromVectorByIndex : IntPtr

    FreeCommonBufferFromVector : IntPtr

    FreeCommonBufferVector : IntPtr

    CreateCommonBufferFromMdl : IntPtr

}
