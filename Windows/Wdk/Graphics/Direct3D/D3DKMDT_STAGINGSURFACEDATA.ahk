#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_STAGINGSURFACEDATA {
    #StructPack 4

    Width : UInt32

    Height : UInt32

    Pitch : UInt32

}
