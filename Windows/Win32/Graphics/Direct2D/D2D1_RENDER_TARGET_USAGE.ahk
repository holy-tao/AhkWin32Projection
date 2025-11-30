#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes how a render target is remoted and whether it should be GDI-compatible. This enumeration allows a bitwise combination of its member values.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/ne-d2d1-d2d1_render_target_usage
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_RENDER_TARGET_USAGE extends Win32BitflagEnum{

    /**
     * The render target attempts to use Direct3D command-stream remoting and uses bitmap remoting if stream remoting fails. The render target is not GDI-compatible.
     * @type {Integer (Int32)}
     */
    static D2D1_RENDER_TARGET_USAGE_NONE => 0

    /**
     * The render target renders content locally and sends it to the terminal services client as a bitmap.
     * @type {Integer (Int32)}
     */
    static D2D1_RENDER_TARGET_USAGE_FORCE_BITMAP_REMOTING => 1

    /**
     * The render target can be used efficiently with GDI.
     * @type {Integer (Int32)}
     */
    static D2D1_RENDER_TARGET_USAGE_GDI_COMPATIBLE => 2
}
