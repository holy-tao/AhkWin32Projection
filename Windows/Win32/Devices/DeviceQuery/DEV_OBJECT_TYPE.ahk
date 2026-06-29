#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 */
export default struct DEV_OBJECT_TYPE {
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
    static DevObjectTypeUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static DevObjectTypeDeviceInterface => 1

    /**
     * @type {Integer (Int32)}
     */
    static DevObjectTypeDeviceContainer => 2

    /**
     * @type {Integer (Int32)}
     */
    static DevObjectTypeDevice => 3

    /**
     * @type {Integer (Int32)}
     */
    static DevObjectTypeDeviceInterfaceClass => 4

    /**
     * @type {Integer (Int32)}
     */
    static DevObjectTypeAEP => 5

    /**
     * @type {Integer (Int32)}
     */
    static DevObjectTypeAEPContainer => 6

    /**
     * @type {Integer (Int32)}
     */
    static DevObjectTypeDeviceInstallerClass => 7

    /**
     * @type {Integer (Int32)}
     */
    static DevObjectTypeDeviceInterfaceDisplay => 8

    /**
     * @type {Integer (Int32)}
     */
    static DevObjectTypeDeviceContainerDisplay => 9

    /**
     * @type {Integer (Int32)}
     */
    static DevObjectTypeAEPService => 10

    /**
     * @type {Integer (Int32)}
     */
    static DevObjectTypeDevicePanel => 11

    /**
     * @type {Integer (Int32)}
     */
    static DevObjectTypeAEPProtocol => 12
}
