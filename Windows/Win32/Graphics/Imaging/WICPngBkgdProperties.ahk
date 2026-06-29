#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the Portable Network Graphics (PNG) background (bKGD) chunk metadata properties.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicpngbkgdproperties
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICPngBkgdProperties {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates the background color. There are three possible types, depending on the image's pixel format.
     * @type {Integer (Int32)}
     */
    static WICPngBkgdBackgroundColor => 1
}
