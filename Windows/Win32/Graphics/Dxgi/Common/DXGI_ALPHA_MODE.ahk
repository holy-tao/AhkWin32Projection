#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Identifies the alpha value, transparency behavior, of a surface.
 * @remarks
 * For more information about alpha mode, see <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ne-dcommon-d2d1_alpha_mode">D2D1_ALPHA_MODE</a>.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/ne-dxgi1_2-dxgi_alpha_mode
 * @namespace Windows.Win32.Graphics.Dxgi.Common
 */
class DXGI_ALPHA_MODE extends Win32Enum {

    /**
     * Indicates that the transparency behavior is not specified.
     * Native name: DXGI_ALPHA_MODE_UNSPECIFIED
     * @type {Integer (Int32)}
     */
    static UNSPECIFIED => 0

    /**
     * Indicates that the transparency behavior is premultiplied. Each color is first scaled by the alpha value. The alpha value itself is the same in both straight and premultiplied alpha. Typically, no color channel value is greater than the alpha channel value. If a color channel value in a premultiplied format is greater than the alpha channel, the standard source-over blending math results in an additive blend.
     * Native name: DXGI_ALPHA_MODE_PREMULTIPLIED
     * @type {Integer (Int32)}
     */
    static PREMULTIPLIED => 1

    /**
     * Indicates that the transparency behavior is not premultiplied. The alpha channel indicates the transparency of the color.
     * Native name: DXGI_ALPHA_MODE_STRAIGHT
     * @type {Integer (Int32)}
     */
    static STRAIGHT => 2

    /**
     * Indicates to ignore the transparency behavior.
     * Native name: DXGI_ALPHA_MODE_IGNORE
     * @type {Integer (Int32)}
     */
    static IGNORE => 3
}
