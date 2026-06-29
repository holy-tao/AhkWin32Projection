#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct FA_EXTENSION_PLUGIN_PHASE {
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
    static FA_PLUGIN_INITIALIZATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static FA_PLUGIN_STACK_ANALYSIS => 2

    /**
     * @type {Integer (Int32)}
     */
    static FA_PLUGIN_PRE_BUCKETING => 4

    /**
     * @type {Integer (Int32)}
     */
    static FA_PLUGIN_POST_BUCKETING => 8
}
