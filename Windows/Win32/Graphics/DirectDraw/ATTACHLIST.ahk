#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDRAWI_DDRAWSURFACE_INT.ahk" { DDRAWI_DDRAWSURFACE_INT }
#Import ".\DDRAWI_DDRAWSURFACE_LCL.ahk" { DDRAWI_DDRAWSURFACE_LCL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct ATTACHLIST {
    #StructPack 8

    dwFlags : UInt32

    lpLink : ATTACHLIST.Ptr

    __lpAttached_ptr : IntPtr
    lpAttached {
        get => (addr := this.__lpAttached_ptr) ? DDRAWI_DDRAWSURFACE_LCL.At(addr) : unset
        set => this.__lpAttached_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    __lpIAttached_ptr : IntPtr
    lpIAttached {
        get => (addr := this.__lpIAttached_ptr) ? DDRAWI_DDRAWSURFACE_INT.At(addr) : unset
        set => this.__lpIAttached_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

}
