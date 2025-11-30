#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The EncoderValue enumeration specifies values that can be passed as arguments to image encoders. For more information about image encoders, see Using Image Encoders and Decoders .
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-encodervalue
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class EncoderValue extends Win32Enum{

    /**
     * Not used in GDI+ version 1.0.
     * @type {Integer (Int32)}
     */
    static EncoderValueColorTypeCMYK => 0

    /**
     * Not used in GDI+ version 1.0.
     * @type {Integer (Int32)}
     */
    static EncoderValueColorTypeYCCK => 1

    /**
     * For a TIFF image, specifies the LZW compression method.
     * @type {Integer (Int32)}
     */
    static EncoderValueCompressionLZW => 2

    /**
     * For a TIFF image, specifies the CCITT3 compression method.
     * @type {Integer (Int32)}
     */
    static EncoderValueCompressionCCITT3 => 3

    /**
     * For a TIFF image, specifies the CCITT4 compression method.
     * @type {Integer (Int32)}
     */
    static EncoderValueCompressionCCITT4 => 4

    /**
     * For a TIFF image, specifies the RLE compression method.
     * @type {Integer (Int32)}
     */
    static EncoderValueCompressionRle => 5

    /**
     * For a TIFF image, specifies no compression.
     * @type {Integer (Int32)}
     */
    static EncoderValueCompressionNone => 6

    /**
     * Not used in GDI+ version 1.0.
     * @type {Integer (Int32)}
     */
    static EncoderValueScanMethodInterlaced => 7

    /**
     * Not used in GDI+ version 1.0.
     * @type {Integer (Int32)}
     */
    static EncoderValueScanMethodNonInterlaced => 8

    /**
     * Not used in GDI+ version 1.0.
     * @type {Integer (Int32)}
     */
    static EncoderValueVersionGif87 => 9

    /**
     * Not used in GDI+ version 1.0.
     * @type {Integer (Int32)}
     */
    static EncoderValueVersionGif89 => 10

    /**
     * Not used in GDI+ version 1.0.
     * @type {Integer (Int32)}
     */
    static EncoderValueRenderProgressive => 11

    /**
     * Not used in GDI+ version 1.0.
     * @type {Integer (Int32)}
     */
    static EncoderValueRenderNonProgressive => 12

    /**
     * For a JPEG image, specifies lossless 90-degree clockwise rotation.
     * @type {Integer (Int32)}
     */
    static EncoderValueTransformRotate90 => 13

    /**
     * For a JPEG image, specifies lossless 180-degree rotation.
     * @type {Integer (Int32)}
     */
    static EncoderValueTransformRotate180 => 14

    /**
     * For a JPEG image, specifies lossless 270-degree clockwise rotation.
     * @type {Integer (Int32)}
     */
    static EncoderValueTransformRotate270 => 15

    /**
     * For a JPEG image, specifies a lossless horizontal flip.
     * @type {Integer (Int32)}
     */
    static EncoderValueTransformFlipHorizontal => 16

    /**
     * For a JPEG image, specifies a lossless vertical flip.
     * @type {Integer (Int32)}
     */
    static EncoderValueTransformFlipVertical => 17

    /**
     * Specifies multiple-frame encoding.
     * @type {Integer (Int32)}
     */
    static EncoderValueMultiFrame => 18

    /**
     * Specifies the last frame of a multiple-frame image.
     * @type {Integer (Int32)}
     */
    static EncoderValueLastFrame => 19

    /**
     * Specifies that the encoder object is to be closed.
     * @type {Integer (Int32)}
     */
    static EncoderValueFlush => 20

    /**
     * Not used in GDI+ version 1.0.
     * @type {Integer (Int32)}
     */
    static EncoderValueFrameDimensionTime => 21

    /**
     * Not used in GDI+ version 1.0.
     * @type {Integer (Int32)}
     */
    static EncoderValueFrameDimensionResolution => 22

    /**
     * For a TIFF image, specifies the page frame dimension
     * @type {Integer (Int32)}
     */
    static EncoderValueFrameDimensionPage => 23

    /**
     * 
     * @type {Integer (Int32)}
     */
    static EncoderValueColorTypeGray => 24

    /**
     * 
     * @type {Integer (Int32)}
     */
    static EncoderValueColorTypeRGB => 25
}
