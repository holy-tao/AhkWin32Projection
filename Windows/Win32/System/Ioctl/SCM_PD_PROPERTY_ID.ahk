#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_PD_PROPERTY_ID extends Win32Enum {

    /**
     * Native name: ScmPhysicalDeviceProperty_DeviceInfo
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceProperty_DeviceInfo => 0

    /**
     * Native name: ScmPhysicalDeviceProperty_ManagementStatus
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceProperty_ManagementStatus => 1

    /**
     * Native name: ScmPhysicalDeviceProperty_FirmwareInfo
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceProperty_FirmwareInfo => 2

    /**
     * Native name: ScmPhysicalDeviceProperty_LocationString
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceProperty_LocationString => 3

    /**
     * Native name: ScmPhysicalDeviceProperty_DeviceSpecificInfo
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceProperty_DeviceSpecificInfo => 4

    /**
     * Native name: ScmPhysicalDeviceProperty_DeviceHandle
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceProperty_DeviceHandle => 5

    /**
     * Native name: ScmPhysicalDeviceProperty_FruIdString
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceProperty_FruIdString => 6

    /**
     * Native name: ScmPhysicalDeviceProperty_RuntimeFwActivationInfo
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceProperty_RuntimeFwActivationInfo => 7

    /**
     * Native name: ScmPhysicalDeviceProperty_RuntimeFwActivationArmState
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceProperty_RuntimeFwActivationArmState => 8

    /**
     * Native name: ScmPhysicalDeviceProperty_Max
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceProperty_Max => 9
}
