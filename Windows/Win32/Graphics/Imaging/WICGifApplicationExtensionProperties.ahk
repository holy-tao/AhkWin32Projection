#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the application extension metadata properties for a Graphics Interchange Format (GIF) image.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wicgifapplicationextensionproperties
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICGifApplicationExtensionProperties{

    /**
     * [VT_UI1 | VT_VECTOR] Indicates a string that identifies the application.
     * @type {Integer (Int32)}
     */
    static WICGifApplicationExtensionApplication => 1

    /**
     * [VT_UI1 \| VT_VECTOR] Indicates data that is exposed by the application.
     * @type {Integer (Int32)}
     */
    static WICGifApplicationExtensionData => 2
}
