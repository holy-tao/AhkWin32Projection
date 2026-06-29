#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HEAPALIASINFO.ahk" { HEAPALIASINFO }
#Import ".\DDSURFACEDESC2.ahk" { DDSURFACEDESC2 }
#Import ".\DDOVERLAYFX.ahk" { DDOVERLAYFX }
#Import ".\DDRAWI_DIRECTDRAW_INT.ahk" { DDRAWI_DIRECTDRAW_INT }
#Import ".\DDSCAPSEX.ahk" { DDSCAPSEX }
#Import ".\DDRAWI_DDVIDEOPORT_LCL.ahk" { DDRAWI_DDVIDEOPORT_LCL }
#Import ".\IUNKNOWN_LIST.ahk" { IUNKNOWN_LIST }
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }
#Import ".\DDRAWI_DDRAWCLIPPER_INT.ahk" { DDRAWI_DDRAWCLIPPER_INT }
#Import ".\DDRAWI_DDRAWSURFACE_LCL.ahk" { DDRAWI_DDRAWSURFACE_LCL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDRAWI_DDRAWSURFACE_MORE {
    #StructPack 8

    dwSize : UInt32

    lpIUnknowns : IUNKNOWN_LIST.Ptr

    __lpDD_lcl_ptr : IntPtr
    lpDD_lcl {
        get => (addr := this.__lpDD_lcl_ptr) ? DDRAWI_DIRECTDRAW_LCL.At(addr) : unset
        set => this.__lpDD_lcl_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    dwPageLockCount : UInt32

    dwBytesAllocated : UInt32

    __lpDD_int_ptr : IntPtr
    lpDD_int {
        get => (addr := this.__lpDD_int_ptr) ? DDRAWI_DIRECTDRAW_INT.At(addr) : unset
        set => this.__lpDD_int_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    dwMipMapCount : UInt32

    __lpDDIClipper_ptr : IntPtr
    lpDDIClipper {
        get => (addr := this.__lpDDIClipper_ptr) ? DDRAWI_DDRAWCLIPPER_INT.At(addr) : unset
        set => this.__lpDDIClipper_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    lpHeapAliasInfo : HEAPALIASINFO.Ptr

    dwOverlayFlags : UInt32

    rgjunc : IntPtr

    __lpVideoPort_ptr : IntPtr
    lpVideoPort {
        get => (addr := this.__lpVideoPort_ptr) ? DDRAWI_DDVIDEOPORT_LCL.At(addr) : unset
        set => this.__lpVideoPort_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    lpddOverlayFX : DDOVERLAYFX.Ptr

    ddsCapsEx : DDSCAPSEX

    dwTextureStage : UInt32

    lpDDRAWReserved : IntPtr

    lpDDRAWReserved2 : IntPtr

    lpDDrawReserved3 : IntPtr

    dwDDrawReserved4 : UInt32

    lpDDrawReserved5 : IntPtr

    lpGammaRamp : IntPtr

    lpOriginalGammaRamp : IntPtr

    lpDDrawReserved6 : IntPtr

    dwSurfaceHandle : UInt32

    qwDDrawReserved8 : UInt32[2]

    lpDDrawReserved9 : IntPtr

    cSurfaces : UInt32

    pCreatedDDSurfaceDesc2 : DDSURFACEDESC2.Ptr

    slist : IntPtr

    dwFVF : UInt32

    lpVB : IntPtr

}
