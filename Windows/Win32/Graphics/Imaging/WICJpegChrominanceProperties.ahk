#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the JPEG chrominance table property.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wicjpegchrominanceproperties
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICJpegChrominanceProperties{

    /**
     * [VT_UI2|VT_VECTOR] Indicates the metadata property is a chrominance table.
     * @type {Integer (Int32)}
     */
    static WICJpegChrominanceTable => 1
}
