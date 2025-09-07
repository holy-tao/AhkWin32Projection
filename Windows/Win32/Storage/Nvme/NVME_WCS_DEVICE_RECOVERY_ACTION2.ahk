#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_WCS_DEVICE_RECOVERY_ACTION2{

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
