#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class EncoderValue extends Win32Enum {

    /**
     * Native name: EncoderValueColorTypeCMYK
     * @type {Integer (Int32)}
     */
    static ColorTypeCMYK => 0

    /**
     * Native name: EncoderValueColorTypeYCCK
     * @type {Integer (Int32)}
     */
    static ColorTypeYCCK => 1

    /**
     * Native name: EncoderValueCompressionLZW
     * @type {Integer (Int32)}
     */
    static CompressionLZW => 2

    /**
     * Native name: EncoderValueCompressionCCITT3
     * @type {Integer (Int32)}
     */
    static CompressionCCITT3 => 3

    /**
     * Native name: EncoderValueCompressionCCITT4
     * @type {Integer (Int32)}
     */
    static CompressionCCITT4 => 4

    /**
     * Native name: EncoderValueCompressionRle
     * @type {Integer (Int32)}
     */
    static CompressionRle => 5

    /**
     * Native name: EncoderValueCompressionNone
     * @type {Integer (Int32)}
     */
    static CompressionNone => 6

    /**
     * Native name: EncoderValueScanMethodInterlaced
     * @type {Integer (Int32)}
     */
    static ScanMethodInterlaced => 7

    /**
     * Native name: EncoderValueScanMethodNonInterlaced
     * @type {Integer (Int32)}
     */
    static ScanMethodNonInterlaced => 8

    /**
     * Native name: EncoderValueVersionGif87
     * @type {Integer (Int32)}
     */
    static VersionGif87 => 9

    /**
     * Native name: EncoderValueVersionGif89
     * @type {Integer (Int32)}
     */
    static VersionGif89 => 10

    /**
     * Native name: EncoderValueRenderProgressive
     * @type {Integer (Int32)}
     */
    static RenderProgressive => 11

    /**
     * Native name: EncoderValueRenderNonProgressive
     * @type {Integer (Int32)}
     */
    static RenderNonProgressive => 12

    /**
     * Native name: EncoderValueTransformRotate90
     * @type {Integer (Int32)}
     */
    static TransformRotate90 => 13

    /**
     * Native name: EncoderValueTransformRotate180
     * @type {Integer (Int32)}
     */
    static TransformRotate180 => 14

    /**
     * Native name: EncoderValueTransformRotate270
     * @type {Integer (Int32)}
     */
    static TransformRotate270 => 15

    /**
     * Native name: EncoderValueTransformFlipHorizontal
     * @type {Integer (Int32)}
     */
    static TransformFlipHorizontal => 16

    /**
     * Native name: EncoderValueTransformFlipVertical
     * @type {Integer (Int32)}
     */
    static TransformFlipVertical => 17

    /**
     * Native name: EncoderValueMultiFrame
     * @type {Integer (Int32)}
     */
    static MultiFrame => 18

    /**
     * Native name: EncoderValueLastFrame
     * @type {Integer (Int32)}
     */
    static LastFrame => 19

    /**
     * Native name: EncoderValueFlush
     * @type {Integer (Int32)}
     */
    static Flush => 20

    /**
     * Native name: EncoderValueFrameDimensionTime
     * @type {Integer (Int32)}
     */
    static FrameDimensionTime => 21

    /**
     * Native name: EncoderValueFrameDimensionResolution
     * @type {Integer (Int32)}
     */
    static FrameDimensionResolution => 22

    /**
     * Native name: EncoderValueFrameDimensionPage
     * @type {Integer (Int32)}
     */
    static FrameDimensionPage => 23

    /**
     * Native name: EncoderValueColorTypeGray
     * @type {Integer (Int32)}
     */
    static ColorTypeGray => 24

    /**
     * Native name: EncoderValueColorTypeRGB
     * @type {Integer (Int32)}
     */
    static ColorTypeRGB => 25
}
