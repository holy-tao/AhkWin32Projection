#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SCM_PD_PROPERTY_ID{

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceProperty_DeviceInfo => 0

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceProperty_ManagementStatus => 1

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceProperty_FirmwareInfo => 2

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceProperty_LocationString => 3

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceProperty_DeviceSpecificInfo => 4

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceProperty_DeviceHandle => 5

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceProperty_FruIdString => 6

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceProperty_RuntimeFwActivationInfo => 7

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceProperty_RuntimeFwActivationArmState => 8

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceProperty_Max => 9
}
