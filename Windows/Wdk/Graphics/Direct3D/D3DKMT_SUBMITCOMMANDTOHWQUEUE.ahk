#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_SUBMITCOMMANDTOHWQUEUE {
    #StructPack 8

    hHwQueue : UInt32

    HwQueueProgressFenceId : Int64

    CommandBuffer : Int64

    CommandLength : UInt32

    PrivateDriverDataSize : UInt32

    pPrivateDriverData : IntPtr

    NumPrimaries : UInt32

    WrittenPrimaries : IntPtr

}
