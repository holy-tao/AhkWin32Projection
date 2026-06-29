#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.ToolHelp
 */
export default struct HEAPENTRY32_FLAGS {
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
    static LF32_FIXED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LF32_FREE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LF32_MOVEABLE => 4
}
