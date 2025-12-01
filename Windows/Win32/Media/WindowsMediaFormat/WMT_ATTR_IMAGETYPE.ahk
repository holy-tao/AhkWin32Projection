#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMT_ATTR_IMAGETYPE enumeration type lists image types that can be stored in the header of an ASF file.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ne-wmsdkidl-wmt_attr_imagetype
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_ATTR_IMAGETYPE extends Win32Enum{

    /**
     * The image is a device-independent bitmap.
     * @type {Integer (Int32)}
     */
    static WMT_IMAGETYPE_BITMAP => 1

    /**
     * The image is in JPEG format.
     * @type {Integer (Int32)}
     */
    static WMT_IMAGETYPE_JPEG => 2

    /**
     * The image is in GIF format.
     * @type {Integer (Int32)}
     */
    static WMT_IMAGETYPE_GIF => 3
}
