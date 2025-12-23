#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class PRINTFLAG extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static PRINTFLAG_MAYBOTHERUSER => 1

    /**
     * @type {Integer (Int32)}
     */
    static PRINTFLAG_PROMPTUSER => 2

    /**
     * @type {Integer (Int32)}
     */
    static PRINTFLAG_USERMAYCHANGEPRINTER => 4

    /**
     * @type {Integer (Int32)}
     */
    static PRINTFLAG_RECOMPOSETODEVICE => 8

    /**
     * @type {Integer (Int32)}
     */
    static PRINTFLAG_DONTACTUALLYPRINT => 16

    /**
     * @type {Integer (Int32)}
     */
    static PRINTFLAG_FORCEPROPERTIES => 32

    /**
     * @type {Integer (Int32)}
     */
    static PRINTFLAG_PRINTTOFILE => 64
}
