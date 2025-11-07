#Requires AutoHotkey v2.0.0 64-bit

/**
 * The VMRRenderPrefs enumeration type is used with the IVMRFilterConfig::GetRenderingPrefs and IVMRFilterConfig::SetRenderingPrefs methods to get and set basic rendering preferences.
 * @remarks
 * 
 * By default the VMR-7 tries to allocate DirectDraw texture surfaces from Video Memory and falls back to AGP memory if there is no Video Memory remaining to fulfill the allocation. In order for the VMR-7 to use AGP memory, the graphics card must have some basic support for blitting from AGP memory to Video Memory.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-vmrrenderprefs
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMRRenderPrefs{

    /**
     * Not implemented; do not use.
     * @type {Integer (Int32)}
     */
    static RenderPrefs_RestrictToInitialMonitor => 0

    /**
     * Indicates that the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/video-mixing-renderer-filter-7">Video Mixing Renderer Filter 7</a> (VMR-7) should use only offscreen surfaces for rendering.
     * @type {Integer (Int32)}
     */
    static RenderPrefs_ForceOffscreen => 1

    /**
     * Indicates that the VMR-7 should fail if no overlay surfaces are available.
     * @type {Integer (Int32)}
     */
    static RenderPrefs_ForceOverlays => 2

    /**
     * Indicates that the VMR-7 should use overlays if they are available. Should not be used by new applications.
     * @type {Integer (Int32)}
     */
    static RenderPrefs_AllowOverlays => 0

    /**
     * Indicates that the VMR-7 should use offscreen surfaces if no overlays are available. Should not be used by new applications.
     * @type {Integer (Int32)}
     */
    static RenderPrefs_AllowOffscreen => 0

    /**
     * Indicates that the application is responsible for painting the color keys.
     * @type {Integer (Int32)}
     */
    static RenderPrefs_DoNotRenderColorKeyAndBorder => 8

    /**
     * Reserved; do not use.
     * @type {Integer (Int32)}
     */
    static RenderPrefs_Reserved => 16

    /**
     * Indicates that the VMR-7 should attempt to use AGP memory when allocating texture surfaces.
     * @type {Integer (Int32)}
     */
    static RenderPrefs_PreferAGPMemWhenMixing => 32

    /**
     * Bitwise <b>OR</b> of all of the above flags.
     * @type {Integer (Int32)}
     */
    static RenderPrefs_Mask => 63
}
