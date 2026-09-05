#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_BUS_FIRMWARE_ACTIVATION_STATE extends Win32Enum {

    /**
     * Native name: ScmBusFirmwareActivationState_Idle
     * @type {Integer (Int32)}
     */
    static Idle => 0

    /**
     * Native name: ScmBusFirmwareActivationState_Armed
     * @type {Integer (Int32)}
     */
    static Armed => 1

    /**
     * Native name: ScmBusFirmwareActivationState_Busy
     * @type {Integer (Int32)}
     */
    static Busy => 2
}
