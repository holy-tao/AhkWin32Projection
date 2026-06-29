#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct SYM_TYPE {
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
    static SymNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static SymCoff => 1

    /**
     * @type {Integer (Int32)}
     */
    static SymCv => 2

    /**
     * @type {Integer (Int32)}
     */
    static SymPdb => 3

    /**
     * @type {Integer (Int32)}
     */
    static SymExport => 4

    /**
     * @type {Integer (Int32)}
     */
    static SymDeferred => 5

    /**
     * @type {Integer (Int32)}
     */
    static SymSym => 6

    /**
     * @type {Integer (Int32)}
     */
    static SymDia => 7

    /**
     * @type {Integer (Int32)}
     */
    static SymVirtual => 8

    /**
     * @type {Integer (Int32)}
     */
    static NumSymTypes => 9
}
