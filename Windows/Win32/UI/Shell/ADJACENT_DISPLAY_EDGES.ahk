#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ADJACENT_DISPLAY_EDGES {
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
    static ADE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static ADE_LEFT => 1

    /**
     * @type {Integer (Int32)}
     */
    static ADE_RIGHT => 2
}
