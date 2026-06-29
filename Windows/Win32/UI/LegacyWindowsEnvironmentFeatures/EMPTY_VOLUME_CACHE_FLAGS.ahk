#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.LegacyWindowsEnvironmentFeatures
 */
export default struct EMPTY_VOLUME_CACHE_FLAGS {
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
    static EVCF_HASSETTINGS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EVCF_ENABLEBYDEFAULT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EVCF_REMOVEFROMLIST => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EVCF_ENABLEBYDEFAULT_AUTO => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EVCF_DONTSHOWIFZERO => 16

    /**
     * @type {Integer (UInt32)}
     */
    static EVCF_SETTINGSMODE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static EVCF_OUTOFDISKSPACE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static EVCF_USERCONSENTOBTAINED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static EVCF_SYSTEMAUTORUN => 256
}
