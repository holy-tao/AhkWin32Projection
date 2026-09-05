#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes how a render target is remoted and whether it should be GDI-compatible. This enumeration allows a bitwise combination of its member values.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_render_target_usage
 * @namespace Windows.Win32.Graphics.Direct2D
 */
class D2D1_RENDER_TARGET_USAGE extends Win32BitflagEnum {

    /**
     * The render target attempts to use Direct3D command-stream remoting and uses bitmap remoting if stream remoting fails. The render target is not GDI-compatible.
     * Native name: D2D1_RENDER_TARGET_USAGE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The render target renders content locally and sends it to the terminal services client as a bitmap.
     * Native name: D2D1_RENDER_TARGET_USAGE_FORCE_BITMAP_REMOTING
     * @type {Integer (Int32)}
     */
    static FORCE_BITMAP_REMOTING => 1

    /**
     * The render target can be used efficiently with GDI.
     * Native name: D2D1_RENDER_TARGET_USAGE_GDI_COMPATIBLE
     * @type {Integer (Int32)}
     */
    static GDI_COMPATIBLE => 2
}
