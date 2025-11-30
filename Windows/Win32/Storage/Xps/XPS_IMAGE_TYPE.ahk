#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the image type.
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/ne-xpsobjectmodel-xps_image_type
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class XPS_IMAGE_TYPE extends Win32Enum{

    /**
     * A JPEG (Joint Photographic Experts Group) image.
     * @type {Integer (Int32)}
     */
    static XPS_IMAGE_TYPE_JPEG => 1

    /**
     * A PNG (Portable Network Graphics) image.
     * @type {Integer (Int32)}
     */
    static XPS_IMAGE_TYPE_PNG => 2

    /**
     * A TIFF (Tagged Image File Format) image.
     * @type {Integer (Int32)}
     */
    static XPS_IMAGE_TYPE_TIFF => 3

    /**
     * An HD Photo (formerly Windows Media Photo) image.
     * @type {Integer (Int32)}
     */
    static XPS_IMAGE_TYPE_WDP => 4

    /**
     * JPEG extended range (JPEG XR) image.
     * @type {Integer (Int32)}
     */
    static XPS_IMAGE_TYPE_JXR => 5
}
