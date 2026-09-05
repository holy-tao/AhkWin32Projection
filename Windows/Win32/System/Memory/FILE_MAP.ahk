#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Memory
 */
class FILE_MAP extends Win32BitflagEnum {

    /**
     * Native name: FILE_MAP_WRITE
     * @type {Integer (UInt32)}
     */
    static WRITE => 2

    /**
     * Native name: FILE_MAP_READ
     * @type {Integer (UInt32)}
     */
    static READ => 4

    /**
     * Native name: FILE_MAP_ALL_ACCESS
     * @type {Integer (UInt32)}
     */
    static ALL_ACCESS => 983071

    /**
     * Native name: FILE_MAP_EXECUTE
     * @type {Integer (UInt32)}
     */
    static EXECUTE => 32

    /**
     * Native name: FILE_MAP_COPY
     * @type {Integer (UInt32)}
     */
    static COPY => 1

    /**
     * Native name: FILE_MAP_RESERVE
     * @type {Integer (UInt32)}
     */
    static RESERVE => 2147483648

    /**
     * Native name: FILE_MAP_TARGETS_INVALID
     * @type {Integer (UInt32)}
     */
    static TARGETS_INVALID => 1073741824

    /**
     * Native name: FILE_MAP_LARGE_PAGES
     * @type {Integer (UInt32)}
     */
    static LARGE_PAGES => 536870912
}
