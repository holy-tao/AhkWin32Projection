#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PM_ENUM_BW_FILTER {
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
    static PM_ENUM_BW_FILTER_BOOTWORKER_ALL => 31

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_BW_FILTER_BY_TASKID => 32

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_BW_FILTER_MAX => 33
}
