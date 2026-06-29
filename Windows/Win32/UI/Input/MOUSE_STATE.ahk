#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input
 */
export default struct MOUSE_STATE {
    value : UInt16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt16)}
     */
    static MOUSE_MOVE_RELATIVE => 0

    /**
     * @type {Integer (UInt16)}
     */
    static MOUSE_MOVE_ABSOLUTE => 1

    /**
     * @type {Integer (UInt16)}
     */
    static MOUSE_VIRTUAL_DESKTOP => 2

    /**
     * @type {Integer (UInt16)}
     */
    static MOUSE_ATTRIBUTES_CHANGED => 4

    /**
     * @type {Integer (UInt16)}
     */
    static MOUSE_MOVE_NOCOALESCE => 8
}
