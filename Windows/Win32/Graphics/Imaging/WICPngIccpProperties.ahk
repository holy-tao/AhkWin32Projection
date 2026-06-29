#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the Portable Network Graphics (PNG) iCCP chunk metadata properties.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicpngiccpproperties
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICPngIccpProperties {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * [VT_LPSTR] Indicates the International Color Consortium (ICC) profile name.
     * @type {Integer (Int32)}
     */
    static WICPngIccpProfileName => 1

    /**
     * [VT_VECTOR \| VT_UI1] Indicates the embedded ICC profile.
     * @type {Integer (Int32)}
     */
    static WICPngIccpProfileData => 2
}
