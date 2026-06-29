#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MPR_INTERFACE_DIAL_MODE {
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
    static MPRDM_DialFirst => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MPRDM_DialAll => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPRDM_DialAsNeeded => 2
}
