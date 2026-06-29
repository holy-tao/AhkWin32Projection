#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TASKDIALOG_ELEMENTS {
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
    static TDE_CONTENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static TDE_EXPANDED_INFORMATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static TDE_FOOTER => 2

    /**
     * @type {Integer (Int32)}
     */
    static TDE_MAIN_INSTRUCTION => 3
}
