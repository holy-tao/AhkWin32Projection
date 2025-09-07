#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SCM_PD_LAST_FW_ACTIVATION_STATUS{

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
