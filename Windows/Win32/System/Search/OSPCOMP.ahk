#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class OSPCOMP extends Win32Enum {

    /**
     * Native name: OSPCOMP_EQ
     * @type {Integer (Int32)}
     */
    static EQ => 1

    /**
     * Native name: OSPCOMP_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 1

    /**
     * Native name: OSPCOMP_LT
     * @type {Integer (Int32)}
     */
    static LT => 2

    /**
     * Native name: OSPCOMP_LE
     * @type {Integer (Int32)}
     */
    static LE => 3

    /**
     * Native name: OSPCOMP_GE
     * @type {Integer (Int32)}
     */
    static GE => 4

    /**
     * Native name: OSPCOMP_GT
     * @type {Integer (Int32)}
     */
    static GT => 5

    /**
     * Native name: OSPCOMP_NE
     * @type {Integer (Int32)}
     */
    static NE => 6
}
