#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_MIRACAST_DISPLAY_STOP_SESSIONS {
    #StructPack 8

    AdapterLuid : IntPtr

    TargetId : UInt32

    StopReason : UInt32

}
