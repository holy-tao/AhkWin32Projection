#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DVIEWPORT7 {
    #StructPack 4

    dwX : UInt32

    dwY : UInt32

    dwWidth : UInt32

    dwHeight : UInt32

    dvMinZ : Float32

    dvMaxZ : Float32

}
