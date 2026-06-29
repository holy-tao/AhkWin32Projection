#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_OUTPUTDUPLPRESENTTOHWQUEUE {
    #StructPack 8

    hSource : UInt32

    VidPnSourceId : UInt32

    BroadcastHwQueueCount : UInt32

    hHwQueues : IntPtr

    PresentRegions : IntPtr

    Flags : IntPtr

    hIndirectHwQueue : UInt32

}
