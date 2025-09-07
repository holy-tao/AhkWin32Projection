#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SCM_PD_FIRMWARE_ACTIVATION_STATE{

    /**
     * @type {Integer (Int32)}
     */
    static ScmPdFirmwareActivationState_Idle => 0

    /**
     * @type {Integer (Int32)}
     */
    static ScmPdFirmwareActivationState_Armed => 1

    /**
     * @type {Integer (Int32)}
     */
    static ScmPdFirmwareActivationState_Busy => 2
}
