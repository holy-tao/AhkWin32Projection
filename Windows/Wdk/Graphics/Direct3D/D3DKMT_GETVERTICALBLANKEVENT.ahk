#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_GETVERTICALBLANKEVENT {
    #StructPack 8

    hAdapter : UInt32

    hDevice : UInt32

    VidPnSourceId : UInt32

    phEvent : IntPtr

}
