#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DVIEWPORT2 {
    #StructPack 4

    dwSize : UInt32

    dwX : UInt32

    dwY : UInt32

    dwWidth : UInt32

    dwHeight : UInt32

    dvClipX : Float32

    dvClipY : Float32

    dvClipWidth : Float32

    dvClipHeight : Float32

    dvMinZ : Float32

    dvMaxZ : Float32

}
