#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct PARAMFLAGS {
    value : UInt16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt16)}
     */
    static PARAMFLAG_NONE => 0

    /**
     * @type {Integer (UInt16)}
     */
    static PARAMFLAG_FIN => 1

    /**
     * @type {Integer (UInt16)}
     */
    static PARAMFLAG_FOUT => 2

    /**
     * @type {Integer (UInt16)}
     */
    static PARAMFLAG_FLCID => 4

    /**
     * @type {Integer (UInt16)}
     */
    static PARAMFLAG_FRETVAL => 8

    /**
     * @type {Integer (UInt16)}
     */
    static PARAMFLAG_FOPT => 16

    /**
     * @type {Integer (UInt16)}
     */
    static PARAMFLAG_FHASDEFAULT => 32

    /**
     * @type {Integer (UInt16)}
     */
    static PARAMFLAG_FHASCUSTDATA => 64
}
