#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_REGISTERTRIMNOTIFICATION {
    #StructPack 8

    AdapterLuid : IntPtr

    hDevice : UInt32

    Callback : IntPtr

    Context : IntPtr

    Handle : IntPtr

}
