#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct HAL_APIC_DESTINATION_MODE {
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
    static ApicDestinationModePhysical => 1

    /**
     * @type {Integer (Int32)}
     */
    static ApicDestinationModeLogicalFlat => 2

    /**
     * @type {Integer (Int32)}
     */
    static ApicDestinationModeLogicalClustered => 3

    /**
     * @type {Integer (Int32)}
     */
    static ApicDestinationModeUnknown => 4
}
