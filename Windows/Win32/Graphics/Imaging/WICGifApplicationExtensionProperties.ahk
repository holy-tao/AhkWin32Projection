#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the application extension metadata properties for a Graphics Interchange Format (GIF) image.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicgifapplicationextensionproperties
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICGifApplicationExtensionProperties extends Win32Enum {

    /**
     * [VT_UI1 | VT_VECTOR] Indicates a string that identifies the application.
     * Native name: WICGifApplicationExtensionApplication
     * @type {Integer (Int32)}
     */
    static Application => 1

    /**
     * [VT_UI1 \| VT_VECTOR] Indicates data that is exposed by the application.
     * Native name: WICGifApplicationExtensionData
     * @type {Integer (Int32)}
     */
    static Data => 2
}
