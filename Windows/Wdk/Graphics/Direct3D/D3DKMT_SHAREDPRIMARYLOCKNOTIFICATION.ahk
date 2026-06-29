#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_SHAREDPRIMARYLOCKNOTIFICATION {
    #StructPack 8

    AdapterLuid : IntPtr

    VidPnSourceId : UInt32

    LockRect : IntPtr

}
