#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Identifies the alpha value, transparency behavior, of a surface. This is a Windows Runtime equivalent of the Desktop [DXGI_ALPHA_MODE](/windows/desktop/api/dxgi1_2/ne-dxgi1_2-dxgi_alpha_mode) enumeration.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.directx.directxalphamode
 * @namespace Windows.Graphics.DirectX
 * @version WindowsRuntime 1.4
 */
class DirectXAlphaMode extends Win32Enum{

    /**
     * Indicates that the transparency behavior is not specified.
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * Indicates that the transparency behavior is premultiplied. Each color is first scaled by the alpha value. The alpha value itself is the same in both straight and premultiplied alpha. Typically, no color channel value is greater than the alpha channel value. If a color channel value in a premultiplied format is greater than the alpha channel, the standard source-over blending math results in an additive blend.
     * @type {Integer (Int32)}
     */
    static Premultiplied => 1

    /**
     * Indicates that the transparency behavior is not premultiplied. The alpha channel indicates the transparency of the color.
     * @type {Integer (Int32)}
     */
    static Straight => 2

    /**
     * Indicates to ignore the transparency behavior.
     * @type {Integer (Int32)}
     */
    static Ignore => 3
}
