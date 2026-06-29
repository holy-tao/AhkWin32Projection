#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct _EXPCMDFLAGS {
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
    static ECF_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static ECF_HASSUBCOMMANDS => 1

    /**
     * @type {Integer (Int32)}
     */
    static ECF_HASSPLITBUTTON => 2

    /**
     * @type {Integer (Int32)}
     */
    static ECF_HIDELABEL => 4

    /**
     * @type {Integer (Int32)}
     */
    static ECF_ISSEPARATOR => 8

    /**
     * @type {Integer (Int32)}
     */
    static ECF_HASLUASHIELD => 16

    /**
     * @type {Integer (Int32)}
     */
    static ECF_SEPARATORBEFORE => 32

    /**
     * @type {Integer (Int32)}
     */
    static ECF_SEPARATORAFTER => 64

    /**
     * @type {Integer (Int32)}
     */
    static ECF_ISDROPDOWN => 128

    /**
     * @type {Integer (Int32)}
     */
    static ECF_TOGGLEABLE => 256

    /**
     * @type {Integer (Int32)}
     */
    static ECF_AUTOMENUICONS => 512
}
