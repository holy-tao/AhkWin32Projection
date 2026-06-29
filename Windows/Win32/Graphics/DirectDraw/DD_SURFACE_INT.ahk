#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_SURFACE_LOCAL.ahk" { DD_SURFACE_LOCAL }

/**
 * The DD_SURFACE_INT structure contains the DirectDrawSurface object's interface information.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_surface_int
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_SURFACE_INT {
    #StructPack 8

    __lpLcl_ptr : IntPtr
    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure that describes a unique surface object.
     */
    lpLcl {
        get => (addr := this.__lpLcl_ptr) ? DD_SURFACE_LOCAL.At(addr) : unset
        set => this.__lpLcl_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

}
