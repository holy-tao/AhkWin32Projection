#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct MEM_DEDICATED_ATTRIBUTE_TYPE {
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
    static MemDedicatedAttributeReadBandwidth => 0

    /**
     * @type {Integer (Int32)}
     */
    static MemDedicatedAttributeReadLatency => 1

    /**
     * @type {Integer (Int32)}
     */
    static MemDedicatedAttributeWriteBandwidth => 2

    /**
     * @type {Integer (Int32)}
     */
    static MemDedicatedAttributeWriteLatency => 3

    /**
     * @type {Integer (Int32)}
     */
    static MemDedicatedAttributeMax => 4
}
