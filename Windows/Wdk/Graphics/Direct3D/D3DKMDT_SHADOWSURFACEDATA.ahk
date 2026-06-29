#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDIFORMAT.ahk" { D3DDDIFORMAT }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_SHADOWSURFACEDATA {
    #StructPack 4

    Width : UInt32

    Height : UInt32

    Format : D3DDDIFORMAT

    Pitch : UInt32

}
