#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TVITEMEXW_CHILDREN {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static I_ZERO => 0

    /**
     * @type {Integer (Int32)}
     */
    static I_ONE_OR_MORE => 1

    /**
     * @type {Integer (Int32)}
     */
    static I_CHILDRENCALLBACK => -1

    /**
     * @type {Integer (Int32)}
     */
    static I_CHILDRENAUTO => -2
}
