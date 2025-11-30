#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICHeifCompressionOption extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WICHeifCompressionDontCare => 0

    /**
     * @type {Integer (Int32)}
     */
    static WICHeifCompressionNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static WICHeifCompressionHEVC => 2

    /**
     * @type {Integer (Int32)}
     */
    static WICHeifCompressionAV1 => 3

    /**
     * @type {Integer (Int32)}
     */
    static WICHeifCompressionJpegXL => 4

    /**
     * @type {Integer (Int32)}
     */
    static WICHeifCompressionBrotli => 5

    /**
     * @type {Integer (Int32)}
     */
    static WICHeifCompressionDeflate => 6
}
