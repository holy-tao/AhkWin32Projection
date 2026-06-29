#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SURFACEALIGNMENT.ahk" { SURFACEALIGNMENT }
#Import ".\DDSCAPS.ahk" { DDSCAPS }

/**
 * The HEAPALIGNMENT structure contains data specifying the alignment requirements for a given display memory heap.
 * @remarks
 * The driver should verify that the <b>dwSize</b> member is at least as large as <b>sizeof</b>(HEAPALIGNMENT).
 * @see https://learn.microsoft.com/windows/win32/api/dmemmgr/ns-dmemmgr-heapalignment
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct HEAPALIGNMENT {
    #StructPack 4

    /**
     * Specifies the size in bytes of this HEAPALIGNMENT structure.
     */
    dwSize : UInt32

    /**
     * Specifies a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550286(v=vs.85)">DDSCAPS</a> structure that indicates what alignment fields are valid.
     */
    ddsCaps : DDSCAPS

    /**
     * Reserved for system use.
     */
    dwReserved : UInt32

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/dmemmgr/ns-dmemmgr-surfacealignment">SURFACEALIGNMENT</a> structure that contains heap alignment requirements for surfaces tagged with DDSCAPS_EXECUTEBUFFER.
     */
    ExecuteBuffer : SURFACEALIGNMENT

    /**
     * Specifies a SURFACEALIGNMENT structure that contains heap alignment requirements for surfaces tagged with DDSCAPS_OVERLAY.
     */
    Overlay : SURFACEALIGNMENT

    /**
     * Specifies a SURFACEALIGNMENT structure that contains heap alignment requirements for surfaces tagged with DDSCAPS_TEXTURE.
     */
    Texture : SURFACEALIGNMENT

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/dmemmgr/ns-dmemmgr-surfacealignment">SURFACEALIGNMENT</a> structure that contains heap alignment requirements for surfaces tagged with DDSCAPS_ZBUFFER.
     */
    ZBuffer : SURFACEALIGNMENT

    /**
     * Specifies a SURFACEALIGNMENT structure that contains heap alignment requirements for surfaces tagged with DDSCAPS_ALPHA.
     */
    AlphaBuffer : SURFACEALIGNMENT

    /**
     * Specifies a SURFACEALIGNMENT structure that contains heap alignment requirements for surfaces tagged with DDSCAPS_OFFSCREENPLAIN.
     */
    Offscreen : SURFACEALIGNMENT

    /**
     * Specifies a SURFACEALIGNMENT structure that contains heap alignment requirements for surfaces tagged with DDSCAPS_FLIP.
     */
    FlipTarget : SURFACEALIGNMENT

}
