#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class DEVICE_REGISTRY_PROPERTY extends Win32Enum {

    /**
     * Native name: DevicePropertyDeviceDescription
     * @type {Integer (Int32)}
     */
    static DeviceDescription => 4096

    /**
     * Native name: DevicePropertyHardwareID
     * @type {Integer (Int32)}
     */
    static HardwareID => 16385

    /**
     * Native name: DevicePropertyCompatibleIDs
     * @type {Integer (Int32)}
     */
    static CompatibleIDs => 16386

    /**
     * Native name: DevicePropertyBootConfiguration
     * @type {Integer (Int32)}
     */
    static BootConfiguration => 3

    /**
     * Native name: DevicePropertyBootConfigurationTranslated
     * @type {Integer (Int32)}
     */
    static BootConfigurationTranslated => 4

    /**
     * Native name: DevicePropertyClassName
     * @type {Integer (Int32)}
     */
    static ClassName => 4101

    /**
     * Native name: DevicePropertyClassGuid
     * @type {Integer (Int32)}
     */
    static ClassGuid => 4102

    /**
     * Native name: DevicePropertyDriverKeyName
     * @type {Integer (Int32)}
     */
    static DriverKeyName => 4103

    /**
     * Native name: DevicePropertyManufacturer
     * @type {Integer (Int32)}
     */
    static Manufacturer => 4104

    /**
     * Native name: DevicePropertyFriendlyName
     * @type {Integer (Int32)}
     */
    static FriendlyName => 4105

    /**
     * Native name: DevicePropertyLocationInformation
     * @type {Integer (Int32)}
     */
    static LocationInformation => 4106

    /**
     * Native name: DevicePropertyPhysicalDeviceObjectName
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceObjectName => 4107

    /**
     * Native name: DevicePropertyBusTypeGuid
     * @type {Integer (Int32)}
     */
    static BusTypeGuid => 8204

    /**
     * Native name: DevicePropertyLegacyBusType
     * @type {Integer (Int32)}
     */
    static LegacyBusType => 13

    /**
     * Native name: DevicePropertyBusNumber
     * @type {Integer (Int32)}
     */
    static BusNumber => 14

    /**
     * Native name: DevicePropertyEnumeratorName
     * @type {Integer (Int32)}
     */
    static EnumeratorName => 4111

    /**
     * Native name: DevicePropertyAddress
     * @type {Integer (Int32)}
     */
    static Address => 16

    /**
     * Native name: DevicePropertyUINumber
     * @type {Integer (Int32)}
     */
    static PropertyUINumber => 17

    /**
     * Native name: DevicePropertyInstallState
     * @type {Integer (Int32)}
     */
    static InstallState => 18

    /**
     * Native name: DevicePropertyRemovalPolicy
     * @type {Integer (Int32)}
     */
    static RemovalPolicy => 19

    /**
     * Native name: DevicePropertyResourceRequirements
     * @type {Integer (Int32)}
     */
    static ResourceRequirements => 20

    /**
     * Native name: DevicePropertyAllocatedResources
     * @type {Integer (Int32)}
     */
    static AllocatedResources => 21

    /**
     * Native name: DevicePropertyContainerID
     * @type {Integer (Int32)}
     */
    static ContainerID => 4118
}
