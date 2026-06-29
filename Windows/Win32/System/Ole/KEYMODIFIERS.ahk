#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct KEYMODIFIERS {
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
    static KEYMOD_SHIFT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KEYMOD_CONTROL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KEYMOD_ALT => 4
}
