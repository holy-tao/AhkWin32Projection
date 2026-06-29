#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct PAGEACTION_UI {
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
    static PAGEACTION_UI_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static PAGEACTION_UI_MODAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static PAGEACTION_UI_MODELESS => 2

    /**
     * @type {Integer (Int32)}
     */
    static PAGEACTION_UI_SILENT => 3
}
