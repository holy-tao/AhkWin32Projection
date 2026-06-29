#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct SIZINGTYPE {
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
    static ST_TRUESIZE => 0

    /**
     * @type {Integer (Int32)}
     */
    static ST_STRETCH => 1

    /**
     * @type {Integer (Int32)}
     */
    static ST_TILE => 2
}
