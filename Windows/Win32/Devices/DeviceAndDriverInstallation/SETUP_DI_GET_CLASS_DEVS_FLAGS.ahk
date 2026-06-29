#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct SETUP_DI_GET_CLASS_DEVS_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static DIGCF_DEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIGCF_PRESENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIGCF_ALLCLASSES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DIGCF_PROFILE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DIGCF_DEVICEINTERFACE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DIGCF_INTERFACEDEVICE => 16
}
