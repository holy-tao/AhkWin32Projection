#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the appearance of the ink nib (pen tip) as part of a D2D1_INK_STYLE_PROPERTIES structure.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/ne-d2d1_3-d2d1_ink_nib_shape
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_INK_NIB_SHAPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The pen tip is circular.
     * @type {Integer (Int32)}
     */
    static D2D1_INK_NIB_SHAPE_ROUND => 0

    /**
     * The pen tip is square.
     * @type {Integer (Int32)}
     */
    static D2D1_INK_NIB_SHAPE_SQUARE => 1
}
