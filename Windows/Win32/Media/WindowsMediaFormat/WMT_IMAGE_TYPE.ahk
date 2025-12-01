#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMT_IMAGE_TYPE enumeration type defines the types of images that can be used for banner ads. This type is used as the value of the BannerImageType attribute.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ne-wmsdkidl-wmt_image_type
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_IMAGE_TYPE extends Win32Enum{

    /**
     * There is no image. If a <a href="https://docs.microsoft.com/windows/desktop/wmformat/bannerimagedata">BannerImageData</a> attribute in the file, it will be ignored.
     * @type {Integer (Int32)}
     */
    static WMT_IT_NONE => 0

    /**
     * The banner image is an uncompressed bitmap.
     * @type {Integer (Int32)}
     */
    static WMT_IT_BITMAP => 1

    /**
     * The banner image uses JPEG encoding.
     * @type {Integer (Int32)}
     */
    static WMT_IT_JPEG => 2

    /**
     * The banner image uses GIF encoding.
     * @type {Integer (Int32)}
     */
    static WMT_IT_GIF => 3
}
