#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_PRESENT_STATS_DWM2 {
    #StructPack 8

    cbSize : UInt32 := this.Size

    PresentCount : UInt32

    PresentRefreshCount : UInt32

    PresentQPCTime : Int64

    SyncRefreshCount : UInt32

    SyncQPCTime : Int64

    CustomPresentDuration : UInt32

    VirtualSyncRefreshCount : UInt32

    VirtualSyncQPCTime : Int64

}
