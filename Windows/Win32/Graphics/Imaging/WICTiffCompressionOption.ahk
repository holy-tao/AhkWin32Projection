#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the Tagged Image File Format (TIFF) compression options.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wictiffcompressionoption
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICTiffCompressionOption extends Win32Enum{

    /**
     * Indicates a suitable compression algorithm based on the image and pixel format.
     * @type {Integer (Int32)}
     */
    static WICTiffCompressionDontCare => 0

    /**
     * Indicates no compression.
     * @type {Integer (Int32)}
     */
    static WICTiffCompressionNone => 1

    /**
     * Indicates a CCITT3 compression algorithm. This algorithm is only valid for 1bpp pixel formats.
     * @type {Integer (Int32)}
     */
    static WICTiffCompressionCCITT3 => 2

    /**
     * Indicates a CCITT4 compression algorithm. This algorithm is only valid for 1bpp pixel formats.
     * @type {Integer (Int32)}
     */
    static WICTiffCompressionCCITT4 => 3

    /**
     * Indicates a LZW compression algorithm.
     * @type {Integer (Int32)}
     */
    static WICTiffCompressionLZW => 4

    /**
     * Indicates a RLE compression algorithm. This algorithm is only valid for 1bpp pixel formats.
     * @type {Integer (Int32)}
     */
    static WICTiffCompressionRLE => 5

    /**
     * Indicates a ZIP compression algorithm.
     * @type {Integer (Int32)}
     */
    static WICTiffCompressionZIP => 6

    /**
     * Indicates an LZWH differencing algorithm.
     * @type {Integer (Int32)}
     */
    static WICTiffCompressionLZWHDifferencing => 7
}
