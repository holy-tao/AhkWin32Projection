#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_POWER_MODE {
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
    static Ndis802_11PowerModeCAM => 0

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11PowerModeMAX_PSP => 1

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11PowerModeFast_PSP => 2

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11PowerModeMax => 3
}
