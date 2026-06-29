#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the JPEG comment properties.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicjpegcommentproperties
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICJpegCommentProperties {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates the metadata property is comment text.
     * @type {Integer (Int32)}
     */
    static WICJpegCommentText => 1
}
