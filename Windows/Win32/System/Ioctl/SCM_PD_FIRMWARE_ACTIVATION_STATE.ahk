#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_PD_FIRMWARE_ACTIVATION_STATE extends Win32Enum {

    /**
     * Native name: ScmPdFirmwareActivationState_Idle
     * @type {Integer (Int32)}
     */
    static Idle => 0

    /**
     * Native name: ScmPdFirmwareActivationState_Armed
     * @type {Integer (Int32)}
     */
    static Armed => 1

    /**
     * Native name: ScmPdFirmwareActivationState_Busy
     * @type {Integer (Int32)}
     */
    static Busy => 2
}
