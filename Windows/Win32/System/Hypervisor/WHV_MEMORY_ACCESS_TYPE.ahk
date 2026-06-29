#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_MEMORY_ACCESS_TYPE {
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
    static WHvMemoryAccessRead => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvMemoryAccessWrite => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvMemoryAccessExecute => 2
}
