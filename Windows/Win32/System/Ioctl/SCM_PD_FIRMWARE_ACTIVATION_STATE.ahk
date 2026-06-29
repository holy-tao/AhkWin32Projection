#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_PD_FIRMWARE_ACTIVATION_STATE {
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
