#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class GENERIC_ACCESS_RIGHTS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static GENERIC_READ => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static GENERIC_WRITE => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static GENERIC_EXECUTE => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static GENERIC_ALL => 268435456
}
