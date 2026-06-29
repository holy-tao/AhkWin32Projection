#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct IDLFLAGS {
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
    static IDLFLAG_NONE => 0

    /**
     * @type {Integer (UInt16)}
     */
    static IDLFLAG_FIN => 1

    /**
     * @type {Integer (UInt16)}
     */
    static IDLFLAG_FOUT => 2

    /**
     * @type {Integer (UInt16)}
     */
    static IDLFLAG_FLCID => 4

    /**
     * @type {Integer (UInt16)}
     */
    static IDLFLAG_FRETVAL => 8
}
