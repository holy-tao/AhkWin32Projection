#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 */
export default struct SCE_LOG_ERR_LEVEL {
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
    static SCE_LOG_LEVEL_ALWAYS => 0

    /**
     * @type {Integer (Int32)}
     */
    static SCE_LOG_LEVEL_ERROR => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCE_LOG_LEVEL_DETAIL => 2

    /**
     * @type {Integer (Int32)}
     */
    static SCE_LOG_LEVEL_DEBUG => 3
}
