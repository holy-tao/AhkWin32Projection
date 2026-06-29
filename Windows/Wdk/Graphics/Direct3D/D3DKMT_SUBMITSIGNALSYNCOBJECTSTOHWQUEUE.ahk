#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_SUBMITSIGNALSYNCOBJECTSTOHWQUEUE {
    #StructPack 8

    Flags : IntPtr

    BroadcastHwQueueCount : UInt32

    BroadcastHwQueueArray : IntPtr

    ObjectCount : UInt32

    ObjectHandleArray : IntPtr

    FenceValueArray : IntPtr

}
