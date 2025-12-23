#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the size of a thumbnail image.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_thumbnail_size
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class XPS_THUMBNAIL_SIZE extends Win32Enum{

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
