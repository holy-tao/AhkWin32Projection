#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CREATE_TAPE_PARTITION_METHOD {
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
    static TAPE_FIXED_PARTITIONS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_INITIATOR_PARTITIONS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_SELECT_PARTITIONS => 1
}
