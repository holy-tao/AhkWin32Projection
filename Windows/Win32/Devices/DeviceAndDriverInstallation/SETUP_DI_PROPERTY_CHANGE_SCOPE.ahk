#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct SETUP_DI_PROPERTY_CHANGE_SCOPE {
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
    static DICS_FLAG_GLOBAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DICS_FLAG_CONFIGSPECIFIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DICS_FLAG_CONFIGGENERAL => 4
}
