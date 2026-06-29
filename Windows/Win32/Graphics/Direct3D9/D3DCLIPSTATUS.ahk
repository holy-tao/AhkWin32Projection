#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DCLIPSTATUS {
    #StructPack 4

    dwFlags : UInt32

    dwStatus : UInt32

    minx : Float32

    maxx : Float32

    miny : Float32

    maxy : Float32

    minz : Float32

    maxz : Float32

}
