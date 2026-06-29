#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
export default struct ACTIVATE_KEYBOARD_LAYOUT_FLAGS {
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
    static KLF_REORDER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KLF_RESET => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static KLF_SETFORPROCESS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static KLF_SHIFTLOCK => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static KLF_ACTIVATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KLF_NOTELLSHELL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static KLF_REPLACELANG => 16

    /**
     * @type {Integer (UInt32)}
     */
    static KLF_SUBSTITUTE_OK => 2
}
