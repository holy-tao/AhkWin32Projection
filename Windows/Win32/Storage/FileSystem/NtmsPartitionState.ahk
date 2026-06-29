#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NtmsPartitionState {
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
    static NTMS_PARTSTATE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PARTSTATE_UNPREPARED => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PARTSTATE_INCOMPATIBLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PARTSTATE_DECOMMISSIONED => 3

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PARTSTATE_AVAILABLE => 4

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PARTSTATE_ALLOCATED => 5

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PARTSTATE_COMPLETE => 6

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PARTSTATE_FOREIGN => 7

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PARTSTATE_IMPORT => 8

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PARTSTATE_RESERVED => 9
}
