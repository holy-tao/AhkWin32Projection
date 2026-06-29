#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct OEM_SOURCE_MEDIA_TYPE {
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
    static SPOST_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SPOST_PATH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SPOST_URL => 2
}
