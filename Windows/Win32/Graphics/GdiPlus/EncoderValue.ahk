#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class EncoderValue extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static EncoderValueColorTypeCMYK => 0

    /**
     * @type {Integer (Int32)}
     */
    static EncoderValueColorTypeYCCK => 1

    /**
     * @type {Integer (Int32)}
     */
    static EncoderValueCompressionLZW => 2

    /**
     * @type {Integer (Int32)}
     */
    static EncoderValueCompressionCCITT3 => 3

    /**
     * @type {Integer (Int32)}
     */
    static EncoderValueCompressionCCITT4 => 4

    /**
     * @type {Integer (Int32)}
     */
    static EncoderValueCompressionRle => 5

    /**
     * @type {Integer (Int32)}
     */
    static EncoderValueCompressionNone => 6

    /**
     * @type {Integer (Int32)}
     */
    static EncoderValueScanMethodInterlaced => 7

    /**
     * @type {Integer (Int32)}
     */
    static EncoderValueScanMethodNonInterlaced => 8

    /**
     * @type {Integer (Int32)}
     */
    static EncoderValueVersionGif87 => 9

    /**
     * @type {Integer (Int32)}
     */
    static EncoderValueVersionGif89 => 10

    /**
     * @type {Integer (Int32)}
     */
    static EncoderValueRenderProgressive => 11

    /**
     * @type {Integer (Int32)}
     */
    static EncoderValueRenderNonProgressive => 12

    /**
     * @type {Integer (Int32)}
     */
    static EncoderValueTransformRotate90 => 13

    /**
     * @type {Integer (Int32)}
     */
    static EncoderValueTransformRotate180 => 14

    /**
     * @type {Integer (Int32)}
     */
    static EncoderValueTransformRotate270 => 15

    /**
     * @type {Integer (Int32)}
     */
    static EncoderValueTransformFlipHorizontal => 16

    /**
     * @type {Integer (Int32)}
     */
    static EncoderValueTransformFlipVertical => 17

    /**
     * @type {Integer (Int32)}
     */
    static EncoderValueMultiFrame => 18

    /**
     * @type {Integer (Int32)}
     */
    static EncoderValueLastFrame => 19

    /**
     * @type {Integer (Int32)}
     */
    static EncoderValueFlush => 20

    /**
     * @type {Integer (Int32)}
     */
    static EncoderValueFrameDimensionTime => 21

    /**
     * @type {Integer (Int32)}
     */
    static EncoderValueFrameDimensionResolution => 22

    /**
     * @type {Integer (Int32)}
     */
    static EncoderValueFrameDimensionPage => 23

    /**
     * @type {Integer (Int32)}
     */
    static EncoderValueColorTypeGray => 24

    /**
     * @type {Integer (Int32)}
     */
    static EncoderValueColorTypeRGB => 25
}
