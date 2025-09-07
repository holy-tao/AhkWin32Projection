#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the JPEG comment properties.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicjpegcommentproperties
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICJpegCommentProperties{

    /**
     * Indicates the metadata property is comment text.
     * @type {Integer (Int32)}
     */
    static WICJpegCommentText => 1
}
