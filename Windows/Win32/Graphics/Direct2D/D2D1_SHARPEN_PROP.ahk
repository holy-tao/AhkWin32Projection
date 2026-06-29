#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifiers for properties of the Sharpen effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects_2/ne-d2d1effects_2-d2d1_sharpen_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_SHARPEN_PROP {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The D2D1_SHARPEN_PROP_SHARPNESS property is a float value indicating how much to sharpen the input image.  The allowed range is 0.0 to 10.0. The default value is 0.0.
     * @type {Integer (Int32)}
     */
    static D2D1_SHARPEN_PROP_SHARPNESS => 0

    /**
     * The D2D1_SHARPEN_PROP_THRESHOLD property is a float value.  The allowed range is 0.0 to 1.0. The default value is 0.0.
     * @type {Integer (Int32)}
     */
    static D2D1_SHARPEN_PROP_THRESHOLD => 1
}
