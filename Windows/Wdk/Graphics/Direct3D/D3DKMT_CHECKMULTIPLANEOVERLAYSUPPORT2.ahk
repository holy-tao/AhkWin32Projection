#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_CHECK_MULTIPLANE_OVERLAY_PLANE2.ahk" { D3DKMT_CHECK_MULTIPLANE_OVERLAY_PLANE2 }
#Import "..\..\..\Win32\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_CHECKMULTIPLANEOVERLAYSUPPORT2 {
    #StructPack 8

    hAdapter : UInt32

    hDevice : UInt32

    PlaneCount : UInt32

    pOverlayPlanes : D3DKMT_CHECK_MULTIPLANE_OVERLAY_PLANE2.Ptr

    Supported : BOOL

    ReturnInfo : IntPtr

}
