#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_WCS_DEVICE_RECOVERY_ACTION1 {
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
    static NVMeDeviceRecoveryNoAction => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVMeDeviceRecoveryFormatNVM => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVMeDeviceRecoveryVendorSpecificCommand => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVMeDeviceRecoveryVendorAnalysis => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVMeDeviceRecoveryDeviceReplacement => 4

    /**
     * @type {Integer (Int32)}
     */
    static NVMeDeviceRecoverySanitize => 5

    /**
     * @type {Integer (Int32)}
     */
    static NVMeDeviceRecovery1Max => 15
}
