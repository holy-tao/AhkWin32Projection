#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct MM_FLAGS {
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
    static MM_ADDSEPARATOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SUBMENUSHAVEIDS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DONTREMOVESEPS => 4
}
