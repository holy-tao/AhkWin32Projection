#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERY_SCANOUT_CAPS {
    #StructPack 4

    VidPnSourceId : UInt32

    Caps : UInt32

}
