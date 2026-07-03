#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDI_ROTATION.ahk" { D3DDDI_ROTATION }
#Import ".\D3DDDI_VIDEO_SIGNAL_SCANLINE_ORDERING.ahk" { D3DDDI_VIDEO_SIGNAL_SCANLINE_ORDERING }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_SETDISPLAYMODE {
    #StructPack 8

    hDevice : UInt32

    hPrimaryAllocation : UInt32

    ScanLineOrdering : D3DDDI_VIDEO_SIGNAL_SCANLINE_ORDERING

    DisplayOrientation : D3DDDI_ROTATION

    PrivateDriverFormatAttribute : UInt32

    Flags : IntPtr

}
