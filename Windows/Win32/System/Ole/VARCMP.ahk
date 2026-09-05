#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 */
class VARCMP extends Win32Enum {

    /**
     * Native name: VARCMP_LT
     * @type {Integer (UInt32)}
     */
    static LT => 0

    /**
     * Native name: VARCMP_EQ
     * @type {Integer (UInt32)}
     */
    static EQ => 1

    /**
     * Native name: VARCMP_GT
     * @type {Integer (UInt32)}
     */
    static GT => 2

    /**
     * Native name: VARCMP_NULL
     * @type {Integer (UInt32)}
     */
    static NULL => 3
}
