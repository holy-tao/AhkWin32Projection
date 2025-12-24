#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class DMA_OPERATIONS extends Win32Struct
{
    static sizeof => 320

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<PPUT_DMA_ADAPTER>}
     */
    PutDmaAdapter {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PALLOCATE_COMMON_BUFFER>}
     */
    AllocateCommonBuffer {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<PFREE_COMMON_BUFFER>}
     */
    FreeCommonBuffer {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PALLOCATE_ADAPTER_CHANNEL>}
     */
    AllocateAdapterChannel {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PFLUSH_ADAPTER_BUFFERS>}
     */
    FlushAdapterBuffers {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<PFREE_ADAPTER_CHANNEL>}
     */
    FreeAdapterChannel {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<PFREE_MAP_REGISTERS>}
     */
    FreeMapRegisters {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<PMAP_TRANSFER>}
     */
    MapTransfer {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<PGET_DMA_ALIGNMENT>}
     */
    GetDmaAlignment {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<PREAD_DMA_COUNTER>}
     */
    ReadDmaCounter {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<PGET_SCATTER_GATHER_LIST>}
     */
    GetScatterGatherList {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<PPUT_SCATTER_GATHER_LIST>}
     */
    PutScatterGatherList {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<PCALCULATE_SCATTER_GATHER_LIST_SIZE>}
     */
    CalculateScatterGatherList {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<PBUILD_SCATTER_GATHER_LIST>}
     */
    BuildScatterGatherList {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<PBUILD_MDL_FROM_SCATTER_GATHER_LIST>}
     */
    BuildMdlFromScatterGatherList {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<PGET_DMA_ADAPTER_INFO>}
     */
    GetDmaAdapterInfo {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Pointer<PGET_DMA_TRANSFER_INFO>}
     */
    GetDmaTransferInfo {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * @type {Pointer<PINITIALIZE_DMA_TRANSFER_CONTEXT>}
     */
    InitializeDmaTransferContext {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * @type {Pointer<PALLOCATE_COMMON_BUFFER_EX>}
     */
    AllocateCommonBufferEx {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {Pointer<PALLOCATE_ADAPTER_CHANNEL_EX>}
     */
    AllocateAdapterChannelEx {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * @type {Pointer<PCONFIGURE_ADAPTER_CHANNEL>}
     */
    ConfigureAdapterChannel {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * @type {Pointer<PCANCEL_ADAPTER_CHANNEL>}
     */
    CancelAdapterChannel {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * @type {Pointer<PMAP_TRANSFER_EX>}
     */
    MapTransferEx {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * @type {Pointer<PGET_SCATTER_GATHER_LIST_EX>}
     */
    GetScatterGatherListEx {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * @type {Pointer<PBUILD_SCATTER_GATHER_LIST_EX>}
     */
    BuildScatterGatherListEx {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * @type {Pointer<PFLUSH_ADAPTER_BUFFERS_EX>}
     */
    FlushAdapterBuffersEx {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * @type {Pointer<PFREE_ADAPTER_OBJECT>}
     */
    FreeAdapterObject {
        get => NumGet(this, 216, "ptr")
        set => NumPut("ptr", value, this, 216)
    }

    /**
     * @type {Pointer<PCANCEL_MAPPED_TRANSFER>}
     */
    CancelMappedTransfer {
        get => NumGet(this, 224, "ptr")
        set => NumPut("ptr", value, this, 224)
    }

    /**
     * @type {Pointer<PALLOCATE_DOMAIN_COMMON_BUFFER>}
     */
    AllocateDomainCommonBuffer {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }

    /**
     * @type {Pointer<PFLUSH_DMA_BUFFER>}
     */
    FlushDmaBuffer {
        get => NumGet(this, 240, "ptr")
        set => NumPut("ptr", value, this, 240)
    }

    /**
     * @type {Pointer<PJOIN_DMA_DOMAIN>}
     */
    JoinDmaDomain {
        get => NumGet(this, 248, "ptr")
        set => NumPut("ptr", value, this, 248)
    }

    /**
     * @type {Pointer<PLEAVE_DMA_DOMAIN>}
     */
    LeaveDmaDomain {
        get => NumGet(this, 256, "ptr")
        set => NumPut("ptr", value, this, 256)
    }

    /**
     * @type {Pointer<PGET_DMA_DOMAIN>}
     */
    GetDmaDomain {
        get => NumGet(this, 264, "ptr")
        set => NumPut("ptr", value, this, 264)
    }

    /**
     * @type {Pointer<PALLOCATE_COMMON_BUFFER_WITH_BOUNDS>}
     */
    AllocateCommonBufferWithBounds {
        get => NumGet(this, 272, "ptr")
        set => NumPut("ptr", value, this, 272)
    }

    /**
     * @type {Pointer<PALLOCATE_COMMON_BUFFER_VECTOR>}
     */
    AllocateCommonBufferVector {
        get => NumGet(this, 280, "ptr")
        set => NumPut("ptr", value, this, 280)
    }

    /**
     * @type {Pointer<PGET_COMMON_BUFFER_FROM_VECTOR_BY_INDEX>}
     */
    GetCommonBufferFromVectorByIndex {
        get => NumGet(this, 288, "ptr")
        set => NumPut("ptr", value, this, 288)
    }

    /**
     * @type {Pointer<PFREE_COMMON_BUFFER_FROM_VECTOR>}
     */
    FreeCommonBufferFromVector {
        get => NumGet(this, 296, "ptr")
        set => NumPut("ptr", value, this, 296)
    }

    /**
     * @type {Pointer<PFREE_COMMON_BUFFER_VECTOR>}
     */
    FreeCommonBufferVector {
        get => NumGet(this, 304, "ptr")
        set => NumPut("ptr", value, this, 304)
    }

    /**
     * @type {Pointer<PCREATE_COMMON_BUFFER_FROM_MDL>}
     */
    CreateCommonBufferFromMdl {
        get => NumGet(this, 312, "ptr")
        set => NumPut("ptr", value, this, 312)
    }
}
