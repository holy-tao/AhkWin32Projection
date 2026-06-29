#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDRAWI_DDVIDEOPORT_INT.ahk" { DDRAWI_DDVIDEOPORT_INT }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DDVIDEOPORTCONNECT.ahk" { DDVIDEOPORTCONNECT }
#Import ".\DDVIDEOPORTINFO.ahk" { DDVIDEOPORTINFO }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import ".\DDVIDEOPORTDESC.ahk" { DDVIDEOPORTDESC }
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }
#Import ".\DDRAWI_DDRAWSURFACE_INT.ahk" { DDRAWI_DDRAWSURFACE_INT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDRAWI_DDVIDEOPORT_LCL {
    #StructPack 8

    __lpDD_ptr : IntPtr
    lpDD {
        get => (addr := this.__lpDD_ptr) ? DDRAWI_DIRECTDRAW_LCL.At(addr) : unset
        set => this.__lpDD_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    ddvpDesc : DDVIDEOPORTDESC

    ddvpInfo : DDVIDEOPORTINFO

    __lpSurface_ptr : IntPtr
    lpSurface {
        get => (addr := this.__lpSurface_ptr) ? DDRAWI_DDRAWSURFACE_INT.At(addr) : unset
        set => this.__lpSurface_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    __lpVBISurface_ptr : IntPtr
    lpVBISurface {
        get => (addr := this.__lpVBISurface_ptr) ? DDRAWI_DDRAWSURFACE_INT.At(addr) : unset
        set => this.__lpVBISurface_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    lpFlipInts : IntPtr

    dwNumAutoflip : UInt32

    dwProcessID : UInt32

    dwStateFlags : UInt32

    dwFlags : UInt32

    dwRefCnt : UInt32

    fpLastFlip : IntPtr

    dwReserved1 : IntPtr

    dwReserved2 : IntPtr

    hDDVideoPort : HANDLE

    dwNumVBIAutoflip : UInt32

    lpVBIDesc : DDVIDEOPORTDESC.Ptr

    lpVideoDesc : DDVIDEOPORTDESC.Ptr

    lpVBIInfo : DDVIDEOPORTINFO.Ptr

    lpVideoInfo : DDVIDEOPORTINFO.Ptr

    dwVBIProcessID : UInt32

    __lpVPNotify_ptr : IntPtr
    lpVPNotify {
        get => (addr := this.__lpVPNotify_ptr) ? DDRAWI_DDVIDEOPORT_INT.At(addr) : unset
        set => this.__lpVPNotify_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

}
