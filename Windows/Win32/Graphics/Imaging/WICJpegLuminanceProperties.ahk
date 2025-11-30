#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the JPEG luminance table property.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wicjpegluminanceproperties
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICJpegLuminanceProperties extends Win32Enum{

    /**
     * [VT_UI2|VT_VECTOR] Indicates the metadata property is a luminance table.
     * @type {Integer (Int32)}
     */
    static WICJpegLuminanceTable => 1
}
