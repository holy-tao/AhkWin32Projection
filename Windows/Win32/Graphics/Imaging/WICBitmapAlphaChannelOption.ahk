#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the desired alpha channel usage.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicbitmapalphachanneloption
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICBitmapAlphaChannelOption extends Win32Enum {

    /**
     * Use alpha channel.
     * Native name: WICBitmapUseAlpha
     * @type {Integer (Int32)}
     */
    static UseAlpha => 0

    /**
     * Use a pre-multiplied alpha channel.
     * Native name: WICBitmapUsePremultipliedAlpha
     * @type {Integer (Int32)}
     */
    static UsePremultipliedAlpha => 1

    /**
     * Ignore alpha channel.
     * Native name: WICBitmapIgnoreAlpha
     * @type {Integer (Int32)}
     */
    static IgnoreAlpha => 2
}
