#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Communication
 */
export default struct MODEMDEVCAPS_DIAL_OPTIONS {
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
    static DIALOPTION_BILLING => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DIALOPTION_DIALTONE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DIALOPTION_QUIET => 128
}
