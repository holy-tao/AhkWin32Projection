#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the image type.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_image_type
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct XPS_IMAGE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
