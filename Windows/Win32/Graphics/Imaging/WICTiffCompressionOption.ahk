#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the Tagged Image File Format (TIFF) compression options.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wictiffcompressionoption
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICTiffCompressionOption extends Win32Enum {

    /**
     * Indicates a suitable compression algorithm based on the image and pixel format.
     * Native name: WICTiffCompressionDontCare
     * @type {Integer (Int32)}
     */
    static DontCare => 0

    /**
     * Indicates no compression.
     * Native name: WICTiffCompressionNone
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * Indicates a CCITT3 compression algorithm. This algorithm is only valid for 1bpp pixel formats.
     * Native name: WICTiffCompressionCCITT3
     * @type {Integer (Int32)}
     */
    static CompressionCCITT3 => 2

    /**
     * Indicates a CCITT4 compression algorithm. This algorithm is only valid for 1bpp pixel formats.
     * Native name: WICTiffCompressionCCITT4
     * @type {Integer (Int32)}
     */
    static CompressionCCITT4 => 3

    /**
     * Indicates a LZW compression algorithm.
     * Native name: WICTiffCompressionLZW
     * @type {Integer (Int32)}
     */
    static CompressionLZW => 4

    /**
     * Indicates a RLE compression algorithm. This algorithm is only valid for 1bpp pixel formats.
     * Native name: WICTiffCompressionRLE
     * @type {Integer (Int32)}
     */
    static CompressionRLE => 5

    /**
     * Indicates a ZIP compression algorithm.
     * Native name: WICTiffCompressionZIP
     * @type {Integer (Int32)}
     */
    static CompressionZIP => 6

    /**
     * Indicates an LZWH differencing algorithm.
     * Native name: WICTiffCompressionLZWHDifferencing
     * @type {Integer (Int32)}
     */
    static CompressionLZWHDifferencing => 7
}
