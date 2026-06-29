#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.ColorSystem
 */
export default struct COLOR_MATCH_TO_TARGET_ACTION {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static CS_ENABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CS_DISABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CS_DELETE_TRANSFORM => 3
}
