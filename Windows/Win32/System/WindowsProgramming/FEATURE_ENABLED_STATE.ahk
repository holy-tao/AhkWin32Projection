#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This enumeration is intended for infrastructure use only. (FEATURE_ENABLED_STATE)
 * @see https://learn.microsoft.com/windows/win32/api/featurestagingapi/ne-featurestagingapi-feature_enabled_state
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct FEATURE_ENABLED_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static FEATURE_ENABLED_STATE_DEFAULT => 0

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static FEATURE_ENABLED_STATE_DISABLED => 1

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static FEATURE_ENABLED_STATE_ENABLED => 2
}
