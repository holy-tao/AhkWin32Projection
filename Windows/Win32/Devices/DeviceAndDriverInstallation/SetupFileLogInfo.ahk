#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct SetupFileLogInfo {
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
    static SetupFileLogSourceFilename => 0

    /**
     * @type {Integer (Int32)}
     */
    static SetupFileLogChecksum => 1

    /**
     * @type {Integer (Int32)}
     */
    static SetupFileLogDiskTagfile => 2

    /**
     * @type {Integer (Int32)}
     */
    static SetupFileLogDiskDescription => 3

    /**
     * @type {Integer (Int32)}
     */
    static SetupFileLogOtherInfo => 4

    /**
     * @type {Integer (Int32)}
     */
    static SetupFileLogMax => 5
}
