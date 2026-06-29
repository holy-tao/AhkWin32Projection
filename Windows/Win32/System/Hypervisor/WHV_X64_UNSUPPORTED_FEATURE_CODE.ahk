#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_X64_UNSUPPORTED_FEATURE_CODE {
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
    static WHvUnsupportedFeatureIntercept => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvUnsupportedFeatureTaskSwitchTss => 2
}
