#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PARTITION_INFORMATION_CLASS {
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
    static SystemMemoryPartitionInformation => 0

    /**
     * @type {Integer (Int32)}
     */
    static SystemMemoryPartitionDedicatedMemoryInformation => 9

    /**
     * @type {Integer (Int32)}
     */
    static SystemMemoryPartitionOpenDedicatedMemory => 10
}
