#Requires AutoHotkey v2.0.0 64-bit

/**
 * The ImageCodecFlags enumeration indicates attributes of an image codec.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusimaging/ne-gdiplusimaging-imagecodecflags
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class ImageCodecFlags{

    /**
     * Indicates that the codec supports encoding (saving).
     * @type {Integer (Int32)}
     */
    static ImageCodecFlagsEncoder => 1

    /**
     * Indicates that the codec supports decoding (reading).
     * @type {Integer (Int32)}
     */
    static ImageCodecFlagsDecoder => 2

    /**
     * Indicates that the codec supports raster images (bitmaps).
     * @type {Integer (Int32)}
     */
    static ImageCodecFlagsSupportBitmap => 4

    /**
     * Indicates that the codec supports vector images (metafiles).
     * @type {Integer (Int32)}
     */
    static ImageCodecFlagsSupportVector => 8

    /**
     * Indicates that an encoder requires a seekable output stream.
     * @type {Integer (Int32)}
     */
    static ImageCodecFlagsSeekableEncode => 16

    /**
     * Indicates that a decoder has blocking behavior during the decoding process.
     * @type {Integer (Int32)}
     */
    static ImageCodecFlagsBlockingDecode => 32

    /**
     * Indicates that the codec is built in to GDI+.
     * @type {Integer (Int32)}
     */
    static ImageCodecFlagsBuiltin => 65536

    /**
     * Not used in GDI+ version 1.0.
     * @type {Integer (Int32)}
     */
    static ImageCodecFlagsSystem => 131072

    /**
     * Not used in GDI+ version 1.0.
     * @type {Integer (Int32)}
     */
    static ImageCodecFlagsUser => 262144
}
