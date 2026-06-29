#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_VIDEO_PRESENT_SOURCE {
    #StructPack 4

    Id : UInt32

    dwReserved : UInt32

}
