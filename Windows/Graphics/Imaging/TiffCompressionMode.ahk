#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the compression mode used for TIFF images.
 * @remarks
 * The TIFF compression modes only effect compression efficiency and do not affect image quality.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.tiffcompressionmode
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class TiffCompressionMode extends Win32Enum{

    /**
     * The compression will be automatically selected.
     * @type {Integer (Int32)}
     */
    static Automatic => 0

    /**
     * No compression will be applied.
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * CCITT3 compression will be applied.
     * @type {Integer (Int32)}
     */
    static Ccitt3 => 2

    /**
     * CCITT4compression will be applied.
     * @type {Integer (Int32)}
     */
    static Ccitt4 => 3

    /**
     * LZW compression will be applied.
     * @type {Integer (Int32)}
     */
    static Lzw => 4

    /**
     * RLE compression will be applied.
     * @type {Integer (Int32)}
     */
    static Rle => 5

    /**
     * ZIP compression will be applied.
     * @type {Integer (Int32)}
     */
    static Zip => 6

    /**
     * LZWH Differencing compression will be applied.
     * @type {Integer (Int32)}
     */
    static LzwhDifferencing => 7
}
