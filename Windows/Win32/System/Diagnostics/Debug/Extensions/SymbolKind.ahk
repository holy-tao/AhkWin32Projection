#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct SymbolKind {
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
    static Symbol => 0

    /**
     * @type {Integer (Int32)}
     */
    static SymbolModule => 1

    /**
     * @type {Integer (Int32)}
     */
    static SymbolType => 2

    /**
     * @type {Integer (Int32)}
     */
    static SymbolField => 3

    /**
     * @type {Integer (Int32)}
     */
    static SymbolConstant => 4

    /**
     * @type {Integer (Int32)}
     */
    static SymbolData => 5

    /**
     * @type {Integer (Int32)}
     */
    static SymbolBaseClass => 6

    /**
     * @type {Integer (Int32)}
     */
    static SymbolPublic => 7

    /**
     * @type {Integer (Int32)}
     */
    static SymbolFunction => 8
}
