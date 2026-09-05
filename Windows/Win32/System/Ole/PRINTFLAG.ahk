#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 */
class PRINTFLAG extends Win32BitflagEnum {

    /**
     * Native name: PRINTFLAG_MAYBOTHERUSER
     * @type {Integer (Int32)}
     */
    static MAYBOTHERUSER => 1

    /**
     * Native name: PRINTFLAG_PROMPTUSER
     * @type {Integer (Int32)}
     */
    static PROMPTUSER => 2

    /**
     * Native name: PRINTFLAG_USERMAYCHANGEPRINTER
     * @type {Integer (Int32)}
     */
    static USERMAYCHANGEPRINTER => 4

    /**
     * Native name: PRINTFLAG_RECOMPOSETODEVICE
     * @type {Integer (Int32)}
     */
    static RECOMPOSETODEVICE => 8

    /**
     * Native name: PRINTFLAG_DONTACTUALLYPRINT
     * @type {Integer (Int32)}
     */
    static DONTACTUALLYPRINT => 16

    /**
     * Native name: PRINTFLAG_FORCEPROPERTIES
     * @type {Integer (Int32)}
     */
    static FORCEPROPERTIES => 32

    /**
     * Native name: PRINTFLAG_PRINTTOFILE
     * @type {Integer (Int32)}
     */
    static PRINTTOFILE => 64
}
