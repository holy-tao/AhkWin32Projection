#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the alpha mode of pixel data.
 * @remarks
 * BitmapAlphaMode is used in conjunction with [BitmapPixelFormat](bitmappixelformat.md) to describe the pixel data.
 * 
 * Using the **Ignore** value effectively treats the pixel data as opaque by discarding the alpha channel data. For example, pixel data returned by a decoder with an alpha mode of **Ignore** and a pixel format of **Rgba8** will have alpha channel values of 0.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapalphamode
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class BitmapAlphaMode extends Win32Enum{

    /**
     * The alpha value has been premultiplied. Each color is first scaled by the alpha value.
     * @type {Integer (Int32)}
     */
    static Premultiplied => 0

    /**
     * The alpha value has not been premultiplied. The alpha channel indicates the transparency of the color.
     * @type {Integer (Int32)}
     */
    static Straight => 1

    /**
     * The alpha value is ignored.
     * @type {Integer (Int32)}
     */
    static Ignore => 2
}
