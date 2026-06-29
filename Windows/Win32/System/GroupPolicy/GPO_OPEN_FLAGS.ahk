#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct GPO_OPEN_FLAGS {
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
    static GPO_OPEN_LOAD_REGISTRY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_OPEN_READ_ONLY => 2
}
