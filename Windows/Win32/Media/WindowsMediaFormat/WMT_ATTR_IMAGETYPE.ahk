#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMT_ATTR_IMAGETYPE enumeration type lists image types that can be stored in the header of an ASF file.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ne-wmsdkidl-wmt_attr_imagetype
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
class WMT_ATTR_IMAGETYPE extends Win32Enum {

    /**
     * The image is a device-independent bitmap.
     * Native name: WMT_IMAGETYPE_BITMAP
     * @type {Integer (Int32)}
     */
    static BITMAP => 1

    /**
     * The image is in JPEG format.
     * Native name: WMT_IMAGETYPE_JPEG
     * @type {Integer (Int32)}
     */
    static JPEG => 2

    /**
     * The image is in GIF format.
     * Native name: WMT_IMAGETYPE_GIF
     * @type {Integer (Int32)}
     */
    static GIF => 3
}
