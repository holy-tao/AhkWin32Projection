#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the desired alpha channel usage.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicbitmapalphachanneloption
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICBitmapAlphaChannelOption {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Use alpha channel.
     * @type {Integer (Int32)}
     */
    static WICBitmapUseAlpha => 0

    /**
     * Use a pre-multiplied alpha channel.
     * @type {Integer (Int32)}
     */
    static WICBitmapUsePremultipliedAlpha => 1

    /**
     * Ignore alpha channel.
     * @type {Integer (Int32)}
     */
    static WICBitmapIgnoreAlpha => 2
}
