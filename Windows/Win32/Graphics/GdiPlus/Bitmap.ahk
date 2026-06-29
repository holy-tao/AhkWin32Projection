#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the Base64 encoded data for a bitmap contained in the Journal file as a background image.
 * @see https://learn.microsoft.com/windows/win32/tablet/bitmap-element
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct Bitmap {
    value : IntPtr

    __value {
        set {
            if (value is Bitmap) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    __New(value := 0) {
        this.value := value
    }
}
