#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Communication
 */
export default struct MODEMDEVCAPS_SPEAKER_MODE {
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
    static MDMSPKRFLAG_CALLSETUP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MDMSPKRFLAG_DIAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MDMSPKRFLAG_OFF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MDMSPKRFLAG_ON => 4
}
