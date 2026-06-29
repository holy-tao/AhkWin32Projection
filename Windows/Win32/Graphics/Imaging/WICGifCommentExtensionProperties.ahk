#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the comment extension metadata properties for a Graphics Interchange Format (GIF) image.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicgifcommentextensionproperties
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICGifCommentExtensionProperties {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * [VT_LPSTR] Indicates the comment text.
     * @type {Integer (Int32)}
     */
    static WICGifCommentExtensionText => 1
}
