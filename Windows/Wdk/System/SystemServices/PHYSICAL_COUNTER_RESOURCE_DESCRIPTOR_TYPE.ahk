#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PHYSICAL_COUNTER_RESOURCE_DESCRIPTOR_TYPE {
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
    static ResourceTypeSingle => 0

    /**
     * @type {Integer (Int32)}
     */
    static ResourceTypeRange => 1

    /**
     * @type {Integer (Int32)}
     */
    static ResourceTypeExtendedCounterConfiguration => 2

    /**
     * @type {Integer (Int32)}
     */
    static ResourceTypeOverflow => 3

    /**
     * @type {Integer (Int32)}
     */
    static ResourceTypeEventBuffer => 4

    /**
     * @type {Integer (Int32)}
     */
    static ResourceTypeIdenitificationTag => 5

    /**
     * @type {Integer (Int32)}
     */
    static ResourceTypeMax => 6
}
