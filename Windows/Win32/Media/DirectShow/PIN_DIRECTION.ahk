#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates a pin's direction.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-pin_direction
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct PIN_DIRECTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Input pin.
     * @type {Integer (Int32)}
     */
    static PINDIR_INPUT => 0

    /**
     * Output pin.
     * @type {Integer (Int32)}
     */
    static PINDIR_OUTPUT => 1
}
