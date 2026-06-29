#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_PRESENT_REDIRECTED {
    #StructPack 8

    hSyncObj : UInt32

    hDevice : UInt32

    WaitedFenceValue : Int64

    PresentHistoryToken : IntPtr

    Flags : IntPtr

    hSource : UInt32

    PrivateDriverDataSize : UInt32

    pPrivateDriverData : IntPtr

}
