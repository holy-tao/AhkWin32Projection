#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct PRINTFLAG {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
