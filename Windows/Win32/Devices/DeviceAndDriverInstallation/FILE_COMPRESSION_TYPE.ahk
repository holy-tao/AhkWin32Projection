#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct FILE_COMPRESSION_TYPE {
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
    static FILE_COMPRESSION_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_COMPRESSION_WINLZA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_COMPRESSION_MSZIP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_COMPRESSION_NTCAB => 3
}
