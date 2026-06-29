#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_SUBMITPRESENTBLTTOHWQUEUE {
    #StructPack 8

    hHwQueue : UInt32

    HwQueueProgressFenceId : Int64

    PrivatePresentData : IntPtr

}
