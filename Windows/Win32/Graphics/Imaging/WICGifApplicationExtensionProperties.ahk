#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the application extension metadata properties for a Graphics Interchange Format (GIF) image.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicgifapplicationextensionproperties
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICGifApplicationExtensionProperties {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
