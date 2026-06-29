#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDCOLORKEY.ahk" { DDCOLORKEY }
#Import ".\DDSCAPS.ahk" { DDSCAPS }
#Import ".\DD_SURFACE_GLOBAL.ahk" { DD_SURFACE_GLOBAL }
#Import ".\DD_SURFACE_MORE.ahk" { DD_SURFACE_MORE }
#Import ".\DD_ATTACHLIST.ahk" { DD_ATTACHLIST }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * The DD_SURFACE_LOCAL structure contains surface-related data that is unique to an individual surface object.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_surface_local
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_SURFACE_LOCAL {
    #StructPack 8

    /**
     * Points to the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_global">DD_SURFACE_GLOBAL</a> structure containing surface data that is shared globally with multiple surfaces.
     */
    lpGbl : DD_SURFACE_GLOBAL.Ptr

    dwFlags : UInt32

    /**
     * Specifies a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550286(v=vs.85)">DDSCAPS</a> structure that describes the capabilities of the surface.
     */
    ddsCaps : DDSCAPS

    /**
     * Reserved for use by the display driver.
     */
    dwReserved1 : IntPtr

    ddckCKSrcOverlay : DDCOLORKEY

    ddckCKDestOverlay : DDCOLORKEY

    __lpSurfMore_ptr : IntPtr
    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_more">DD_SURFACE_MORE</a> structure that contains additional local surface data.
     */
    lpSurfMore {
        get => (addr := this.__lpSurfMore_ptr) ? DD_SURFACE_MORE.At(addr) : unset
        set => this.__lpSurfMore_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    __lpAttachList_ptr : IntPtr
    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_attachlist">DD_ATTACHLIST</a> structure that contains the list of surfaces to which this surface attached.
     */
    lpAttachList {
        get => (addr := this.__lpAttachList_ptr) ? DD_ATTACHLIST.At(addr) : unset
        set => this.__lpAttachList_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    __lpAttachListFrom_ptr : IntPtr
    /**
     * Points to a DD_ATTACHLIST structure that contains the list of surfaces attached to this surface.
     */
    lpAttachListFrom {
        get => (addr := this.__lpAttachListFrom_ptr) ? DD_ATTACHLIST.At(addr) : unset
        set => this.__lpAttachListFrom_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    /**
     * Reserved for system use and should be ignored by the driver.
     */
    rcOverlaySrc : RECT

    static __New() {
        DefineProp(this.Prototype, 'ddckCKSrcBlt', { type: DDCOLORKEY, offset: 24 })
        DefineProp(this.Prototype, 'ddckCKDestBlt', { type: DDCOLORKEY, offset: 32 })
        this.DeleteProp("__New")
    }
}
