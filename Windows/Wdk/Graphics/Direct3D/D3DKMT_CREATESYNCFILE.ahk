#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_CREATESYNCFILE {
    #StructPack 8

    hDevice : UInt32

    hMonitoredFence : UInt32

    FenceValue : Int64

    hSyncFile : Int64

}
