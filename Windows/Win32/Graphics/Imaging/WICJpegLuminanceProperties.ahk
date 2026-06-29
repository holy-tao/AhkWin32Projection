#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the JPEG luminance table property.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicjpegluminanceproperties
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICJpegLuminanceProperties {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * [VT_UI2|VT_VECTOR] Indicates the metadata property is a luminance table.
     * @type {Integer (Int32)}
     */
    static WICJpegLuminanceTable => 1
}
