#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Memory
 */
class SECTION_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: SECTION_ALL_ACCESS
     * @type {Integer (UInt32)}
     */
    static ALL_ACCESS => 983071

    /**
     * Native name: SECTION_QUERY
     * @type {Integer (UInt32)}
     */
    static QUERY => 1

    /**
     * Native name: SECTION_MAP_WRITE
     * @type {Integer (UInt32)}
     */
    static MAP_WRITE => 2

    /**
     * Native name: SECTION_MAP_READ
     * @type {Integer (UInt32)}
     */
    static MAP_READ => 4

    /**
     * Native name: SECTION_MAP_EXECUTE
     * @type {Integer (UInt32)}
     */
    static MAP_EXECUTE => 8

    /**
     * Native name: SECTION_EXTEND_SIZE
     * @type {Integer (UInt32)}
     */
    static EXTEND_SIZE => 16

    /**
     * Native name: SECTION_MAP_EXECUTE_EXPLICIT
     * @type {Integer (UInt32)}
     */
    static MAP_EXECUTE_EXPLICIT => 32
}
