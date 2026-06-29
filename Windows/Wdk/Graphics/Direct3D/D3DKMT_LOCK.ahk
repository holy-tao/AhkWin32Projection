#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_LOCK {
    #StructPack 8

    hDevice : UInt32

    hAllocation : UInt32

    PrivateDriverData : UInt32

    NumPages : UInt32

    pPages : IntPtr

    pData : IntPtr

    Flags : IntPtr

    GpuVirtualAddress : Int64

}
