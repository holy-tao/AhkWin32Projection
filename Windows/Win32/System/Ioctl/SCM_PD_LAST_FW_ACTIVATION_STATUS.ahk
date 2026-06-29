#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_PD_LAST_FW_ACTIVATION_STATUS {
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
    static ScmPdLastFwActivationStatus_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static ScmPdLastFwActivationStatus_Success => 1

    /**
     * @type {Integer (Int32)}
     */
    static ScmPdLastFwActivationStatus_FwNotFound => 2

    /**
     * @type {Integer (Int32)}
     */
    static ScmPdLastFwActivationStatus_ColdRebootRequired => 3

    /**
     * @type {Integer (Int32)}
     */
    static ScmPdLastFwActivaitonStatus_ActivationInProgress => 4

    /**
     * @type {Integer (Int32)}
     */
    static ScmPdLastFwActivaitonStatus_Retry => 5

    /**
     * @type {Integer (Int32)}
     */
    static ScmPdLastFwActivaitonStatus_FwUnsupported => 6

    /**
     * @type {Integer (Int32)}
     */
    static ScmPdLastFwActivaitonStatus_UnknownError => 7
}
