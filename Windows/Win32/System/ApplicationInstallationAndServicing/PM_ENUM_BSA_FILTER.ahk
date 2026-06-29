#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PM_ENUM_BSA_FILTER {
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
    static PM_ENUM_BSA_FILTER_ALL => 26

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_BSA_FILTER_BY_TASKID => 27

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_BSA_FILTER_BY_PRODUCTID => 28

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_BSA_FILTER_BY_PERIODIC => 29

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_BSA_FILTER_BY_ALL_LAUNCHONBOOT => 30

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_BSA_FILTER_MAX => 31
}
