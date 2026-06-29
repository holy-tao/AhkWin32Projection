#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_LogicalMemoryType {
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
    static KS_MemoryTypeDontCare => 0

    /**
     * @type {Integer (Int32)}
     */
    static KS_MemoryTypeKernelPaged => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_MemoryTypeKernelNonPaged => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_MemoryTypeDeviceHostMapped => 3

    /**
     * @type {Integer (Int32)}
     */
    static KS_MemoryTypeDeviceSpecific => 4

    /**
     * @type {Integer (Int32)}
     */
    static KS_MemoryTypeUser => 5

    /**
     * @type {Integer (Int32)}
     */
    static KS_MemoryTypeAnyHost => 6
}
