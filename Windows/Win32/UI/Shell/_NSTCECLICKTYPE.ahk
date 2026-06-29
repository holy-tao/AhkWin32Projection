#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct _NSTCECLICKTYPE {
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
    static NSTCECT_LBUTTON => 1

    /**
     * @type {Integer (Int32)}
     */
    static NSTCECT_MBUTTON => 2

    /**
     * @type {Integer (Int32)}
     */
    static NSTCECT_RBUTTON => 3

    /**
     * @type {Integer (Int32)}
     */
    static NSTCECT_BUTTON => 3

    /**
     * @type {Integer (Int32)}
     */
    static NSTCECT_DBLCLICK => 4
}
