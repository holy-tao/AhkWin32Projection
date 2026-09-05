#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the image type.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_image_type
 * @namespace Windows.Win32.Storage.Xps
 */
class XPS_IMAGE_TYPE extends Win32Enum {

    /**
     * A JPEG (Joint Photographic Experts Group) image.
     * Native name: XPS_IMAGE_TYPE_JPEG
     * @type {Integer (Int32)}
     */
    static JPEG => 1

    /**
     * A PNG (Portable Network Graphics) image.
     * Native name: XPS_IMAGE_TYPE_PNG
     * @type {Integer (Int32)}
     */
    static PNG => 2

    /**
     * A TIFF (Tagged Image File Format) image.
     * Native name: XPS_IMAGE_TYPE_TIFF
     * @type {Integer (Int32)}
     */
    static TIFF => 3

    /**
     * An HD Photo (formerly Windows Media Photo) image.
     * Native name: XPS_IMAGE_TYPE_WDP
     * @type {Integer (Int32)}
     */
    static WDP => 4

    /**
     * JPEG extended range (JPEG XR) image.
     * Native name: XPS_IMAGE_TYPE_JXR
     * @type {Integer (Int32)}
     */
    static JXR => 5
}
