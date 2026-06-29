#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct PREPARE_TAPE_OPERATION {
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
    static TAPE_FORMAT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_LOAD => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_LOCK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_TENSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_UNLOAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_UNLOCK => 4
}
