#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDRAWI_DDRAWSURFACE_INT.ahk" { DDRAWI_DDRAWSURFACE_INT }
#Import ".\DDRAWI_DDRAWSURFACE_LCL.ahk" { DDRAWI_DDRAWSURFACE_LCL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DBLNODE {
    #StructPack 8

    next : DBLNODE.Ptr

    prev : DBLNODE.Ptr

    __object_ptr : IntPtr
    object {
        get => (addr := this.__object_ptr) ? DDRAWI_DDRAWSURFACE_LCL.At(addr) : unset
        set => this.__object_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    __object_int_ptr : IntPtr
    object_int {
        get => (addr := this.__object_int_ptr) ? DDRAWI_DDRAWSURFACE_INT.At(addr) : unset
        set => this.__object_int_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

}
