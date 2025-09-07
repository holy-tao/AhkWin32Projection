#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class TAPE_POSITION_METHOD{

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
