#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the animation properties of a WebP image.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicwebpanimproperties
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICWebpAnimProperties {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The number of times the animation loops. A value of 0 indicates that the animation will loop infinitely.
     * @type {Integer (Int32)}
     */
    static WICWebpAnimLoopCount => 1
}
