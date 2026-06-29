#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_SURFACE_LOCAL.ahk" { DD_SURFACE_LOCAL }

/**
 * The DD_ATTACHLIST structure maintains a list of attached surfaces for Microsoft DirectDraw.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_attachlist
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_ATTACHLIST {
    #StructPack 8

    /**
     * Points to the next attached surface.
     */
    lpLink : DD_ATTACHLIST.Ptr

    __lpAttached_ptr : IntPtr
    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure that contains the attached surface local object.
     */
    lpAttached {
        get => (addr := this.__lpAttached_ptr) ? DD_SURFACE_LOCAL.At(addr) : unset
        set => this.__lpAttached_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

}
