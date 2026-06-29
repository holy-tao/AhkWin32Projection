#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct TAPE_POSITION_METHOD {
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
    static TAPE_ABSOLUTE_BLOCK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_LOGICAL_BLOCK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_REWIND => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_SPACE_END_OF_DATA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_SPACE_FILEMARKS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_SPACE_RELATIVE_BLOCKS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_SPACE_SEQUENTIAL_FMKS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_SPACE_SEQUENTIAL_SMKS => 9

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_SPACE_SETMARKS => 8
}
