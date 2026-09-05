#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICHeifCompressionOption extends Win32Enum {

    /**
     * Native name: WICHeifCompressionDontCare
     * @type {Integer (Int32)}
     */
    static DontCare => 0

    /**
     * Native name: WICHeifCompressionNone
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * Native name: WICHeifCompressionHEVC
     * @type {Integer (Int32)}
     */
    static CompressionHEVC => 2

    /**
     * Native name: WICHeifCompressionAV1
     * @type {Integer (Int32)}
     */
    static CompressionAV1 => 3

    /**
     * Native name: WICHeifCompressionJpegXL
     * @type {Integer (Int32)}
     */
    static JpegXL => 4

    /**
     * Native name: WICHeifCompressionBrotli
     * @type {Integer (Int32)}
     */
    static Brotli => 5

    /**
     * Native name: WICHeifCompressionDeflate
     * @type {Integer (Int32)}
     */
    static Deflate => 6
}
