#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class TAPE_POSITION_METHOD extends Win32Enum {

    /**
     * Native name: TAPE_ABSOLUTE_BLOCK
     * @type {Integer (UInt32)}
     */
    static ABSOLUTE_BLOCK => 1

    /**
     * Native name: TAPE_LOGICAL_BLOCK
     * @type {Integer (UInt32)}
     */
    static LOGICAL_BLOCK => 2

    /**
     * Native name: TAPE_REWIND
     * @type {Integer (UInt32)}
     */
    static REWIND => 0

    /**
     * Native name: TAPE_SPACE_END_OF_DATA
     * @type {Integer (UInt32)}
     */
    static SPACE_END_OF_DATA => 4

    /**
     * Native name: TAPE_SPACE_FILEMARKS
     * @type {Integer (UInt32)}
     */
    static SPACE_FILEMARKS => 6

    /**
     * Native name: TAPE_SPACE_RELATIVE_BLOCKS
     * @type {Integer (UInt32)}
     */
    static SPACE_RELATIVE_BLOCKS => 5

    /**
     * Native name: TAPE_SPACE_SEQUENTIAL_FMKS
     * @type {Integer (UInt32)}
     */
    static SPACE_SEQUENTIAL_FMKS => 7

    /**
     * Native name: TAPE_SPACE_SEQUENTIAL_SMKS
     * @type {Integer (UInt32)}
     */
    static SPACE_SEQUENTIAL_SMKS => 9

    /**
     * Native name: TAPE_SPACE_SETMARKS
     * @type {Integer (UInt32)}
     */
    static SPACE_SETMARKS => 8
}
