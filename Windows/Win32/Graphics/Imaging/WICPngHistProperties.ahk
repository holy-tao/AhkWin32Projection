#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the Portable Network Graphics (PNG) hIST chunk metadata properties.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicpnghistproperties
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICPngHistProperties {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * [VT_VECTOR | VT_UI2] Indicates the approximate usage frequency of each color in the color palette.
     * @type {Integer (Int32)}
     */
    static WICPngHistFrequencies => 1
}
