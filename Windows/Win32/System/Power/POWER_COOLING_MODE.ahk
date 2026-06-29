#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct POWER_COOLING_MODE {
    value : UInt16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt16)}
     */
    static PO_TZ_ACTIVE => 0

    /**
     * @type {Integer (UInt16)}
     */
    static PO_TZ_PASSIVE => 1

    /**
     * @type {Integer (UInt16)}
     */
    static PO_TZ_INVALID_MODE => 2
}
