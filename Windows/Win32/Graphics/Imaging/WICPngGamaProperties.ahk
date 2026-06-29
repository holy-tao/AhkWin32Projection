#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the Portable Network Graphics (PNG) gAMA chunk metadata properties.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicpnggamaproperties
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICPngGamaProperties {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * [VT_UI4] Indicates the gamma value.
     * @type {Integer (Int32)}
     */
    static WICPngGamaGamma => 1
}
