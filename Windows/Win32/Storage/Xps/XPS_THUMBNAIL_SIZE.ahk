#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the size of a thumbnail image.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_thumbnail_size
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct XPS_THUMBNAIL_SIZE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The thumbnail image is 32 pixels wide and 32 pixels high.
     * @type {Integer (Int32)}
     */
    static XPS_THUMBNAIL_SIZE_VERYSMALL => 1

    /**
     * The thumbnail image is 64 pixels wide and 64 pixels high.
     * @type {Integer (Int32)}
     */
    static XPS_THUMBNAIL_SIZE_SMALL => 2

    /**
     * The thumbnail image is 100 pixels wide and 100 pixels high.
     * @type {Integer (Int32)}
     */
    static XPS_THUMBNAIL_SIZE_MEDIUM => 3

    /**
     * The thumbnail image is 300 pixels wide and 300 pixels high.
     * @type {Integer (Int32)}
     */
    static XPS_THUMBNAIL_SIZE_LARGE => 4
}
