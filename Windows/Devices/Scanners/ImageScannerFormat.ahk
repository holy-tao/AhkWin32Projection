#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The type of files to scan to.
 * @remarks
 * All WIA scanner devices support the Windows Device Independent Bitmap (DIB) format. By default, these values in this order will be selected based on the file formats the device supports.
 * + 1. Jpeg
 * + 2. Png
 * + 3. Bitmap
 * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerformat
 * @namespace Windows.Devices.Scanners
 * @version WindowsRuntime 1.4
 */
class ImageScannerFormat extends Win32Enum{

    /**
     * Exchangeable image file format/EXIF or JPEG file interchange format/JFIF Use these files only in color or grayscale modes (8 bits per channel/sample), with single page and compressed (lossy JPEG compression).
     * @type {Integer (Int32)}
     */
    static Jpeg => 0

    /**
     * Portable Network Graphics (PNG) image file format This value supports any color mode, with single page and compressed (loseless PNG compression).
     * @type {Integer (Int32)}
     */
    static Png => 1

    /**
     * Windows Device Independent Bitmap (DIB) This value supports any color mode, with single page and uncompressed. This is the only format that is supported by all compatible WIA 2.0 scanner devices.
     * @type {Integer (Int32)}
     */
    static DeviceIndependentBitmap => 2

    /**
     * Uncompressed Tagged Image File Format (TIFF) compatible with the TIFF 6.0 specification, either single and/or multi-page These files can be in any color mode supported by this API, always uncompressed and either single page (if only one image has to be transferred) or multi-page (if multiple images have to be transferred and the device supports this multi-page file format).
     * @type {Integer (Int32)}
     */
    static Tiff => 3

    /**
     * Microsoft XML Paper Specification (XPS) document file format These files can contain image data in any color mode supported by this API, compressed at the choice of the device, either single or multi-page.
     * @type {Integer (Int32)}
     */
    static Xps => 4

    /**
     * Open XML Paper Specification (OpenXPS) document file format These files can contain image data in any color mode supported by this API, compressed at the choice of the device, either single or multi-page.
     * @type {Integer (Int32)}
     */
    static OpenXps => 5

    /**
     * Portable Document Format PDF/A (PDF/A is an ISO-standardized version of the Portable Document Format/PDF specialized for the digital preservation of electronic documents) document file format These files can contain image data in any color mode supported by this API, compressed at the choice of the device, either single or multi-page.
     * @type {Integer (Int32)}
     */
    static Pdf => 6
}
