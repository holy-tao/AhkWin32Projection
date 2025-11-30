#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the desired alpha channel usage.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wicbitmapalphachanneloption
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICBitmapAlphaChannelOption extends Win32Enum{

    /**
     * Use alpha channel.
     * @type {Integer (Int32)}
     */
    static WICBitmapUseAlpha => 0

    /**
     * Use a pre-multiplied alpha channel.
     * @type {Integer (Int32)}
     */
    static WICBitmapUsePremultipliedAlpha => 1

    /**
     * Ignore alpha channel.
     * @type {Integer (Int32)}
     */
    static WICBitmapIgnoreAlpha => 2
}
