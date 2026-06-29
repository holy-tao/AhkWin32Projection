#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Memory
 */
export default struct VIRTUAL_FREE_TYPE {
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
    static MEM_DECOMMIT => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_RELEASE => 32768
}
