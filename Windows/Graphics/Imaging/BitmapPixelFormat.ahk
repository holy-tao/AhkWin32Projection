#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the pixel format of pixel data. Each enumeration value defines a channel ordering, bit depth, and data type.
 * @remarks
 * BitmapPixelFormat is used in conjunction with [BitmapAlphaMode](bitmapalphamode.md) to fully describe the pixel data.
 * 
 * The set of pixel formats represented by BitmapPixelFormat is smaller than the set of native pixel formats that can be supported by the bitmap codecs. For example, certain codecs support 32 bit floating point values. In these cases there will be a loss in fidelity when obtaining pixel data from the bitmap.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmappixelformat
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class BitmapPixelFormat extends Win32Enum{

    /**
     * The pixel format is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The pixel format is R16G16B16A16 unsigned integer.
     * @type {Integer (Int32)}
     */
    static Rgba16 => 12

    /**
     * The pixel format is R8G8B8A8 unsigned integer.
     * @type {Integer (Int32)}
     */
    static Rgba8 => 30

    /**
     * The pixel format is 16 bpp grayscale.
     * @type {Integer (Int32)}
     */
    static Gray16 => 57

    /**
     * The pixel format is 8 bpp grayscale.
     * @type {Integer (Int32)}
     */
    static Gray8 => 62

    /**
     * The pixel format is B8G8R8A8 unsigned integer.
     * @type {Integer (Int32)}
     */
    static Bgra8 => 87

    /**
     * The pixel format is NV12.
     * @type {Integer (Int32)}
     */
    static Nv12 => 103

    /**
     * The pixel format is P010.
     * @type {Integer (Int32)}
     */
    static P010 => 104

    /**
     * The pixel format is YUY2.
     * @type {Integer (Int32)}
     */
    static Yuy2 => 107
}
