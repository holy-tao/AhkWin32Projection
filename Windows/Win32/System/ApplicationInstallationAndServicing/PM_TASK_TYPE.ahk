#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PM_TASK_TYPE {
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
    static PM_TASK_TYPE_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_TYPE_DEFAULT => 1

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_TYPE_SETTINGS => 2

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_TYPE_BACKGROUNDSERVICEAGENT => 3

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_TYPE_BACKGROUNDWORKER => 4

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_TYPE_INVALID => 5
}
