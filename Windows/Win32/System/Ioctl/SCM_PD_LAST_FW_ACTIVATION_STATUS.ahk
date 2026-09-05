#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_PD_LAST_FW_ACTIVATION_STATUS extends Win32Enum {

    /**
     * Native name: ScmPdLastFwActivationStatus_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: ScmPdLastFwActivationStatus_Success
     * @type {Integer (Int32)}
     */
    static Success => 1

    /**
     * Native name: ScmPdLastFwActivationStatus_FwNotFound
     * @type {Integer (Int32)}
     */
    static FwNotFound => 2

    /**
     * Native name: ScmPdLastFwActivationStatus_ColdRebootRequired
     * @type {Integer (Int32)}
     */
    static ColdRebootRequired => 3

    /**
     * Native name: ScmPdLastFwActivaitonStatus_ActivationInProgress
     * @type {Integer (Int32)}
     */
    static ActivaitonStatus_ActivationInProgress => 4

    /**
     * Native name: ScmPdLastFwActivaitonStatus_Retry
     * @type {Integer (Int32)}
     */
    static ActivaitonStatus_Retry => 5

    /**
     * Native name: ScmPdLastFwActivaitonStatus_FwUnsupported
     * @type {Integer (Int32)}
     */
    static ActivaitonStatus_FwUnsupported => 6

    /**
     * Native name: ScmPdLastFwActivaitonStatus_UnknownError
     * @type {Integer (Int32)}
     */
    static ActivaitonStatus_UnknownError => 7
}
