#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DVIEWPORT {
    #StructPack 4

    dwSize : UInt32

    dwX : UInt32

    dwY : UInt32

    dwWidth : UInt32

    dwHeight : UInt32

    dvScaleX : Float32

    dvScaleY : Float32

    dvMaxX : Float32

    dvMaxY : Float32

    dvMinZ : Float32

    dvMaxZ : Float32

}
