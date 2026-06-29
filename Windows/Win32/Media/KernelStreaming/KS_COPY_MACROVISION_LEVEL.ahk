#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_COPY_MACROVISION_LEVEL {
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
    static KS_MACROVISION_DISABLED => 0

    /**
     * @type {Integer (Int32)}
     */
    static KS_MACROVISION_LEVEL1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_MACROVISION_LEVEL2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_MACROVISION_LEVEL3 => 3
}
