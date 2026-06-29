#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_CREATEHWQUEUE {
    #StructPack 8

    hHwContext : UInt32

    Flags : IntPtr

    PrivateDriverDataSize : UInt32

    pPrivateDriverData : IntPtr

    hHwQueue : UInt32

    hHwQueueProgressFence : UInt32

    HwQueueProgressFenceCPUVirtualAddress : IntPtr

    HwQueueProgressFenceGPUVirtualAddress : Int64

}
