#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This enumeration is intended for infrastructure use only. (FEATURE_CHANGE_TIME)
 * @see https://learn.microsoft.com/windows/win32/api/featurestagingapi/ne-featurestagingapi-feature_change_time
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct FEATURE_CHANGE_TIME {
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
    static FEATURE_CHANGE_TIME_READ => 0

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static FEATURE_CHANGE_TIME_MODULE_RELOAD => 1

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static FEATURE_CHANGE_TIME_SESSION => 2

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static FEATURE_CHANGE_TIME_REBOOT => 3
}
