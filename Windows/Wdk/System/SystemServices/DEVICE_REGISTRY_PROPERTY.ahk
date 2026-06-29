#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DEVICE_REGISTRY_PROPERTY {
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
    static DevicePropertyDeviceDescription => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DevicePropertyHardwareID => 16385

    /**
     * @type {Integer (Int32)}
     */
    static DevicePropertyCompatibleIDs => 16386

    /**
     * @type {Integer (Int32)}
     */
    static DevicePropertyBootConfiguration => 3

    /**
     * @type {Integer (Int32)}
     */
    static DevicePropertyBootConfigurationTranslated => 4

    /**
     * @type {Integer (Int32)}
     */
    static DevicePropertyClassName => 4101

    /**
     * @type {Integer (Int32)}
     */
    static DevicePropertyClassGuid => 4102

    /**
     * @type {Integer (Int32)}
     */
    static DevicePropertyDriverKeyName => 4103

    /**
     * @type {Integer (Int32)}
     */
    static DevicePropertyManufacturer => 4104

    /**
     * @type {Integer (Int32)}
     */
    static DevicePropertyFriendlyName => 4105

    /**
     * @type {Integer (Int32)}
     */
    static DevicePropertyLocationInformation => 4106

    /**
     * @type {Integer (Int32)}
     */
    static DevicePropertyPhysicalDeviceObjectName => 4107

    /**
     * @type {Integer (Int32)}
     */
    static DevicePropertyBusTypeGuid => 8204

    /**
     * @type {Integer (Int32)}
     */
    static DevicePropertyLegacyBusType => 13

    /**
     * @type {Integer (Int32)}
     */
    static DevicePropertyBusNumber => 14

    /**
     * @type {Integer (Int32)}
     */
    static DevicePropertyEnumeratorName => 4111

    /**
     * @type {Integer (Int32)}
     */
    static DevicePropertyAddress => 16

    /**
     * @type {Integer (Int32)}
     */
    static DevicePropertyUINumber => 17

    /**
     * @type {Integer (Int32)}
     */
    static DevicePropertyInstallState => 18

    /**
     * @type {Integer (Int32)}
     */
    static DevicePropertyRemovalPolicy => 19

    /**
     * @type {Integer (Int32)}
     */
    static DevicePropertyResourceRequirements => 20

    /**
     * @type {Integer (Int32)}
     */
    static DevicePropertyAllocatedResources => 21

    /**
     * @type {Integer (Int32)}
     */
    static DevicePropertyContainerID => 4118
}
