#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes whether a render target uses hardware or software rendering, or if Direct2D should select the rendering mode.
 * @remarks
 * 
 * Not every render target supports hardware rendering. For more information, see the <a href="https://docs.microsoft.com/windows/win32/Direct2D/render-targets-overview">Render Targets Overview</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/ne-d2d1-d2d1_render_target_type
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_RENDER_TARGET_TYPE extends Win32Enum{

    /**
     * The render target uses hardware rendering, if available; otherwise, it uses software rendering.
     * @type {Integer (Int32)}
     */
    static D2D1_RENDER_TARGET_TYPE_DEFAULT => 0

    /**
     * The render target uses software rendering only.
     * @type {Integer (Int32)}
     */
    static D2D1_RENDER_TARGET_TYPE_SOFTWARE => 1

    /**
     * The render target uses hardware rendering only.
     * @type {Integer (Int32)}
     */
    static D2D1_RENDER_TARGET_TYPE_HARDWARE => 2
}
