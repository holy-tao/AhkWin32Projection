#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_CREATE_DOORBELL {
    #StructPack 8

    hHwQueue : UInt32

    hRingBuffer : UInt32

    hRingBufferControl : UInt32

    Flags : IntPtr

    PrivateDriverDataSize : UInt32

    PrivateDriverData : IntPtr

    DoorbellCPUVirtualAddress : IntPtr

    DoorbellSecondaryCPUVirtualAddress : IntPtr

    DoorbellStatusCPUVirtualAddress : IntPtr

}
