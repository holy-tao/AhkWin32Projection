#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class VARCMP extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static VARCMP_LT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static VARCMP_EQ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VARCMP_GT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VARCMP_NULL => 3
}
