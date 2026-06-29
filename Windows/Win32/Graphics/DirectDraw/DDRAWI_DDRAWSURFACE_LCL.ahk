#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDCOLORKEY.ahk" { DDCOLORKEY }
#Import ".\DDRAWI_DDRAWCLIPPER_LCL.ahk" { DDRAWI_DDRAWCLIPPER_LCL }
#Import ".\DDSCAPS.ahk" { DDSCAPS }
#Import ".\DDRAWI_DDRAWPALETTE_INT.ahk" { DDRAWI_DDRAWPALETTE_INT }
#Import ".\ATTACHLIST.ahk" { ATTACHLIST }
#Import ".\DDRAWI_DDRAWSURFACE_MORE.ahk" { DDRAWI_DDRAWSURFACE_MORE }
#Import ".\DDRAWI_DDRAWCLIPPER_INT.ahk" { DDRAWI_DDRAWCLIPPER_INT }
#Import ".\DDRAWI_DDRAWSURFACE_INT.ahk" { DDRAWI_DDRAWSURFACE_INT }
#Import ".\DBLNODE.ahk" { DBLNODE }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\DDRAWI_DDRAWSURFACE_GBL.ahk" { DDRAWI_DDRAWSURFACE_GBL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDRAWI_DDRAWSURFACE_LCL {
    #StructPack 8

    __lpSurfMore_ptr : IntPtr
    lpSurfMore {
        get => (addr := this.__lpSurfMore_ptr) ? DDRAWI_DDRAWSURFACE_MORE.At(addr) : unset
        set => this.__lpSurfMore_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    __lpGbl_ptr : IntPtr
    lpGbl {
        get => (addr := this.__lpGbl_ptr) ? DDRAWI_DDRAWSURFACE_GBL.At(addr) : unset
        set => this.__lpGbl_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    hDDSurface : IntPtr

    __lpAttachList_ptr : IntPtr
    lpAttachList {
        get => (addr := this.__lpAttachList_ptr) ? ATTACHLIST.At(addr) : unset
        set => this.__lpAttachList_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    __lpAttachListFrom_ptr : IntPtr
    lpAttachListFrom {
        get => (addr := this.__lpAttachListFrom_ptr) ? ATTACHLIST.At(addr) : unset
        set => this.__lpAttachListFrom_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    dwLocalRefCnt : UInt32

    dwProcessId : UInt32

    dwFlags : UInt32

    ddsCaps : DDSCAPS

    __lpDDPalette_ptr : IntPtr
    lpDDPalette {
        get => (addr := this.__lpDDPalette_ptr) ? DDRAWI_DDRAWPALETTE_INT.At(addr) : unset
        set => this.__lpDDPalette_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    lp16DDPalette {
        get => (addr := this.__lp16DDPalette_ptr) ? DDRAWI_DDRAWPALETTE_INT.At(addr) : unset
        set => this.__lp16DDPalette_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    __lpDDClipper_ptr : IntPtr
    lpDDClipper {
        get => (addr := this.__lpDDClipper_ptr) ? DDRAWI_DDRAWCLIPPER_LCL.At(addr) : unset
        set => this.__lpDDClipper_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    lp16DDClipper {
        get => (addr := this.__lp16DDClipper_ptr) ? DDRAWI_DDRAWCLIPPER_INT.At(addr) : unset
        set => this.__lp16DDClipper_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    dwModeCreatedIn : UInt32

    dwBackBufferCount : UInt32

    ddckCKDestBlt : DDCOLORKEY

    ddckCKSrcBlt : DDCOLORKEY

    hDC : IntPtr

    dwReserved1 : IntPtr

    ddckCKSrcOverlay : DDCOLORKEY

    ddckCKDestOverlay : DDCOLORKEY

    __lpSurfaceOverlaying_ptr : IntPtr
    lpSurfaceOverlaying {
        get => (addr := this.__lpSurfaceOverlaying_ptr) ? DDRAWI_DDRAWSURFACE_INT.At(addr) : unset
        set => this.__lpSurfaceOverlaying_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    dbnOverlayNode : DBLNODE

    rcOverlaySrc : RECT

    rcOverlayDest : RECT

    dwClrXparent : UInt32

    dwAlpha : UInt32

    lOverlayX : Int32

    lOverlayY : Int32

    static __New() {
        DefineProp(this.Prototype, '__lp16DDPalette_ptr', { type: IntPtr, offset: 56 })
        DefineProp(this.Prototype, '__lp16DDClipper_ptr', { type: IntPtr, offset: 64 })
        this.DeleteProp("__New")
    }
}
