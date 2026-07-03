#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDIFORMAT.ahk" { D3DDDIFORMAT }
#Import ".\D3DKMDT_GDISURFACETYPE.ahk" { D3DKMDT_GDISURFACETYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_GDISURFACEDATA {
    #StructPack 8

    Width : UInt32

    Height : UInt32

    Format : D3DDDIFORMAT

    Type : D3DKMDT_GDISURFACETYPE

    Flags : IntPtr

    Pitch : UInt32

}
