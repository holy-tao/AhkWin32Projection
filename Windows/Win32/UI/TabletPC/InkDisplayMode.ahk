#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies how a selection appears on the control.
 * @see https://learn.microsoft.com/windows/win32/api/inked/ne-inked-inkdisplaymode
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct InkDisplayMode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The selection appears as ink.
     * @type {Integer (Int32)}
     */
    static IDM_Ink => 0

    /**
     * The selection appears as text.
     * @type {Integer (Int32)}
     */
    static IDM_Text => 1
}
