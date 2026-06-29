#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDIFORMAT.ahk" { D3DDDIFORMAT }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_SHAREDPRIMARYSURFACEDATA {
    #StructPack 8

    Width : UInt32

    Height : UInt32

    Format : D3DDDIFORMAT

    RefreshRate : IntPtr

    VidPnSourceId : UInt32

}
