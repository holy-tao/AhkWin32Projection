#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_CHECK_MULTIPLANE_OVERLAY_PLANE.ahk" { D3DKMT_CHECK_MULTIPLANE_OVERLAY_PLANE }
#Import "..\..\..\Win32\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_CHECKMULTIPLANEOVERLAYSUPPORT {
    #StructPack 8

    hDevice : UInt32

    PlaneCount : UInt32

    pOverlayPlanes : D3DKMT_CHECK_MULTIPLANE_OVERLAY_PLANE.Ptr

    Supported : BOOL

    ReturnInfo : IntPtr

}
