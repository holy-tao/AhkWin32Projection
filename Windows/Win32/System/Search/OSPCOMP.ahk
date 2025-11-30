#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class OSPCOMP extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static OSPCOMP_EQ => 1

    /**
     * @type {Integer (Int32)}
     */
    static OSPCOMP_DEFAULT => 1

    /**
     * @type {Integer (Int32)}
     */
    static OSPCOMP_LT => 2

    /**
     * @type {Integer (Int32)}
     */
    static OSPCOMP_LE => 3

    /**
     * @type {Integer (Int32)}
     */
    static OSPCOMP_GE => 4

    /**
     * @type {Integer (Int32)}
     */
    static OSPCOMP_GT => 5

    /**
     * @type {Integer (Int32)}
     */
    static OSPCOMP_NE => 6
}
