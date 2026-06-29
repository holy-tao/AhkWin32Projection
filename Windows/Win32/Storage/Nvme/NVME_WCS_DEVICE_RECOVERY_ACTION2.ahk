#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_WCS_DEVICE_RECOVERY_ACTION2 {
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
    static NVMeDeviceRecoveryControllerReset => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVMeDeviceRecoverySubsystemReset => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVMeDeviceRecoveryPcieFunctionReset => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVMeDeviceRecoveryPERST => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVMeDeviceRecoveryPowerCycle => 4

    /**
     * @type {Integer (Int32)}
     */
    static NVMeDeviceRecoveryPcieHotReset => 5

    /**
     * @type {Integer (Int32)}
     */
    static NVMeDeviceRecovery2Max => 15
}
