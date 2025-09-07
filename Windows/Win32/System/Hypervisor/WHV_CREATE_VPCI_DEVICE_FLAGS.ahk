#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_CREATE_VPCI_DEVICE_FLAGS{

    /**
     * @type {Integer (Int32)}
     */
    static WHvCreateVpciDeviceFlagNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvCreateVpciDeviceFlagPhysicallyBacked => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvCreateVpciDeviceFlagUseLogicalInterrupts => 2
}
