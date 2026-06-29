#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Communication
 */
export default struct MODEM_SPEAKER_VOLUME {
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
    static MDMVOL_HIGH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MDMVOL_LOW => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MDMVOL_MEDIUM => 1
}
