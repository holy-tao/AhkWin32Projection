#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that identify the top level properties of the White Level Adjustment effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects_2/ne-d2d1effects_2-d2d1_whiteleveladjustment_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_WHITELEVELADJUSTMENT_PROP {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Identifies the `InputWhiteLevel` property of the effect. The property is of type FLOAT, and is specified in nits.
     * @type {Integer (Int32)}
     */
    static D2D1_WHITELEVELADJUSTMENT_PROP_INPUT_WHITE_LEVEL => 0

    /**
     * Identifies the `OutputWhiteLevel` property of the effect. The property is of type FLOAT, and is specified in nits.
     * @type {Integer (Int32)}
     */
    static D2D1_WHITELEVELADJUSTMENT_PROP_OUTPUT_WHITE_LEVEL => 1
}
