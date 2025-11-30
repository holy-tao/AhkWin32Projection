#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_WCS_DEVICE_RECOVERY_ACTION1 extends Win32Enum{

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
