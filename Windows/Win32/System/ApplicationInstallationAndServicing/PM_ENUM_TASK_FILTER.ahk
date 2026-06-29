#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PM_ENUM_TASK_FILTER {
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
    static PM_TASK_FILTER_APP_ALL => 12

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_FILTER_TASK_TYPE => 13

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_FILTER_DEHYD_SUPRESSING => 14

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_FILTER_APP_TASK_TYPE => 15

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_FILTER_BGEXECUTION => 16

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_FILTER_MAX => 17
}
