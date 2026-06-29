#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct CWP_FLAGS {
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
    static CWP_ALL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CWP_SKIPINVISIBLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CWP_SKIPDISABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CWP_SKIPTRANSPARENT => 4
}
