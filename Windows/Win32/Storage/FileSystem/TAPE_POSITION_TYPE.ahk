#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class TAPE_POSITION_TYPE extends Win32Enum {

    /**
     * Native name: TAPE_ABSOLUTE_POSITION
     * @type {Integer (UInt32)}
     */
    static ABSOLUTE_POSITION => 0

    /**
     * Native name: TAPE_LOGICAL_POSITION
     * @type {Integer (UInt32)}
     */
    static LOGICAL_POSITION => 1
}
