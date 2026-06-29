#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct STREAMING_CONTROL_REQUEST_TYPE {
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
    static CdromStreamingDisable => 1

    /**
     * @type {Integer (Int32)}
     */
    static CdromStreamingEnableForReadOnly => 2

    /**
     * @type {Integer (Int32)}
     */
    static CdromStreamingEnableForWriteOnly => 3

    /**
     * @type {Integer (Int32)}
     */
    static CdromStreamingEnableForReadWrite => 4
}
