#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VMRRenderPrefs enumeration type is used with the IVMRFilterConfig::GetRenderingPrefs and IVMRFilterConfig::SetRenderingPrefs methods to get and set basic rendering preferences.
 * @remarks
 * By default the VMR-7 tries to allocate DirectDraw texture surfaces from Video Memory and falls back to AGP memory if there is no Video Memory remaining to fulfill the allocation. In order for the VMR-7 to use AGP memory, the graphics card must have some basic support for blitting from AGP memory to Video Memory.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-vmrrenderprefs
 * @namespace Windows.Win32.Media.DirectShow
 */
class VMRRenderPrefs extends Win32Enum {

    /**
     * Not implemented; do not use.
     * Native name: RenderPrefs_RestrictToInitialMonitor
     * @type {Integer (Int32)}
     */
    static RestrictToInitialMonitor => 0

    /**
     * Indicates that the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/video-mixing-renderer-filter-7">Video Mixing Renderer Filter 7</a> (VMR-7) should use only offscreen surfaces for rendering.
     * Native name: RenderPrefs_ForceOffscreen
     * @type {Integer (Int32)}
     */
    static ForceOffscreen => 1

    /**
     * Indicates that the VMR-7 should fail if no overlay surfaces are available.
     * Native name: RenderPrefs_ForceOverlays
     * @type {Integer (Int32)}
     */
    static ForceOverlays => 2

    /**
     * Indicates that the VMR-7 should use overlays if they are available. Should not be used by new applications.
     * Native name: RenderPrefs_AllowOverlays
     * @type {Integer (Int32)}
     */
    static AllowOverlays => 0

    /**
     * Indicates that the VMR-7 should use offscreen surfaces if no overlays are available. Should not be used by new applications.
     * Native name: RenderPrefs_AllowOffscreen
     * @type {Integer (Int32)}
     */
    static AllowOffscreen => 0

    /**
     * Indicates that the application is responsible for painting the color keys.
     * Native name: RenderPrefs_DoNotRenderColorKeyAndBorder
     * @type {Integer (Int32)}
     */
    static DoNotRenderColorKeyAndBorder => 8

    /**
     * Reserved; do not use.
     * Native name: RenderPrefs_Reserved
     * @type {Integer (Int32)}
     */
    static Reserved => 16

    /**
     * Indicates that the VMR-7 should attempt to use AGP memory when allocating texture surfaces.
     * Native name: RenderPrefs_PreferAGPMemWhenMixing
     * @type {Integer (Int32)}
     */
    static PreferAGPMemWhenMixing => 32

    /**
     * Bitwise <b>OR</b> of all of the above flags.
     * Native name: RenderPrefs_Mask
     * @type {Integer (Int32)}
     */
    static Mask => 63
}
