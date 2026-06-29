#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_ADJUSTFULLSCREENGAMMA {
    #StructPack 8

    hAdapter : UInt32

    VidPnSourceId : UInt32

    Scale : IntPtr

    Offset : IntPtr

}
