#Requires AutoHotkey v2.0.0 64-bit

/**
 * The ImageFlags enumeration specifies the attributes of the pixel data contained in an Image object. The Image::GetFlags method returns an element of this enumeration.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusimaging/ne-gdiplusimaging-imageflags
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class ImageFlags{

    /**
     * Specifies no format information.
     * @type {Integer (Int32)}
     */
    static ImageFlagsNone => 0

    /**
     * Specifies that the image can be scaled.
     * @type {Integer (Int32)}
     */
    static ImageFlagsScalable => 1

    /**
     * Specifies that the pixel data contains alpha values.
     * @type {Integer (Int32)}
     */
    static ImageFlagsHasAlpha => 2

    /**
     * Specifies that the pixel data has alpha values other than 0 (transparent) and 255 (opaque).
     * @type {Integer (Int32)}
     */
    static ImageFlagsHasTranslucent => 4

    /**
     * Specifies that the pixel data is partially scalable with some limitations.
     * @type {Integer (Int32)}
     */
    static ImageFlagsPartiallyScalable => 8

    /**
     * Specifies that the image is stored using an RGB color space.
     * @type {Integer (Int32)}
     */
    static ImageFlagsColorSpaceRGB => 16

    /**
     * Specifies that the image is stored using a CMYK color space.
     * @type {Integer (Int32)}
     */
    static ImageFlagsColorSpaceCMYK => 32

    /**
     * Specifies that the image is a grayscale image.
     * @type {Integer (Int32)}
     */
    static ImageFlagsColorSpaceGRAY => 64

    /**
     * Specifies that the image is stored using a YCBCR color space.
     * @type {Integer (Int32)}
     */
    static ImageFlagsColorSpaceYCBCR => 128

    /**
     * Specifies that the image is stored using a YCCK color space.
     * @type {Integer (Int32)}
     */
    static ImageFlagsColorSpaceYCCK => 256

    /**
     * Specifies that dots per inch information is stored in the image.
     * @type {Integer (Int32)}
     */
    static ImageFlagsHasRealDPI => 4096

    /**
     * Specifies that the pixel size is stored in the image.
     * @type {Integer (Int32)}
     */
    static ImageFlagsHasRealPixelSize => 8192

    /**
     * Specifies that the pixel data is read-only.
     * @type {Integer (Int32)}
     */
    static ImageFlagsReadOnly => 65536

    /**
     * Specifies that the pixel data can be cached for faster access.
     * @type {Integer (Int32)}
     */
    static ImageFlagsCaching => 131072
}
