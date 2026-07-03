#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDIFORMAT.ahk" { D3DDDIFORMAT }
#Import ".\D3DDDI_ROTATION.ahk" { D3DDDI_ROTATION }
#Import ".\D3DDDI_VIDEO_SIGNAL_SCANLINE_ORDERING.ahk" { D3DDDI_VIDEO_SIGNAL_SCANLINE_ORDERING }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_DISPLAYMODE {
    #StructPack 8

    Width : UInt32

    Height : UInt32

    Format : D3DDDIFORMAT

    IntegerRefreshRate : UInt32

    RefreshRate : IntPtr

    ScanLineOrdering : D3DDDI_VIDEO_SIGNAL_SCANLINE_ORDERING

    DisplayOrientation : D3DDDI_ROTATION

    DisplayFixedOutput : UInt32

    Flags : IntPtr

}
