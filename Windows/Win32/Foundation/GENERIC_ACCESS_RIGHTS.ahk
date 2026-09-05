#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Foundation
 */
class GENERIC_ACCESS_RIGHTS extends Win32BitflagEnum {

    /**
     * Native name: GENERIC_READ
     * @type {Integer (UInt32)}
     */
    static READ => 2147483648

    /**
     * Native name: GENERIC_WRITE
     * @type {Integer (UInt32)}
     */
    static WRITE => 1073741824

    /**
     * Native name: GENERIC_EXECUTE
     * @type {Integer (UInt32)}
     */
    static EXECUTE => 536870912

    /**
     * Native name: GENERIC_ALL
     * @type {Integer (UInt32)}
     */
    static ALL => 268435456
}
