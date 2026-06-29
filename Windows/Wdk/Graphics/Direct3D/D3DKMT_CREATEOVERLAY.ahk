#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_CREATEOVERLAY {
    #StructPack 8

    VidPnSourceId : UInt32

    hDevice : UInt32

    OverlayInfo : IntPtr

    hOverlay : UInt32

}
