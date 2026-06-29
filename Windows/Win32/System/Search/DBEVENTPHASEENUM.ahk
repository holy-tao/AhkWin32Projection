#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBEVENTPHASEENUM {
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
    static DBEVENTPHASE_OKTODO => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBEVENTPHASE_ABOUTTODO => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBEVENTPHASE_SYNCHAFTER => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBEVENTPHASE_FAILEDTODO => 3

    /**
     * @type {Integer (Int32)}
     */
    static DBEVENTPHASE_DIDEVENT => 4
}
