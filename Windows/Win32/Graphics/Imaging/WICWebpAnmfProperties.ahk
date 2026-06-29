#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the animation frame properties of a WebP image.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicwebpanmfproperties
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICWebpAnmfProperties {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The time to wait before displaying the next frame, in milliseconds.
     * @type {Integer (Int32)}
     */
    static WICWebpAnmfFrameDuration => 1
}
