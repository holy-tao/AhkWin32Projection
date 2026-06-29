#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_MULTIPLANE_OVERLAY_POST_COMPOSITION_WITH_SOURCE.ahk" { D3DKMT_MULTIPLANE_OVERLAY_POST_COMPOSITION_WITH_SOURCE }
#Import ".\D3DKMT_CHECK_MULTIPLANE_OVERLAY_PLANE3.ahk" { D3DKMT_CHECK_MULTIPLANE_OVERLAY_PLANE3 }
#Import "..\..\..\Win32\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_CHECKMULTIPLANEOVERLAYSUPPORT3 {
    #StructPack 8

    hAdapter : UInt32

    hDevice : UInt32

    PlaneCount : UInt32

    ppOverlayPlanes : IntPtr

    PostCompositionCount : UInt32

    ppPostComposition : IntPtr

    Supported : BOOL

    ReturnInfo : IntPtr

}
