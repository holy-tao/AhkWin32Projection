#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies how ink is inserted onto the InkEdit control.
 * @see https://learn.microsoft.com/windows/win32/api/inked/ne-inked-inkinsertmode
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct InkInsertMode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Default. Drawn ink is inserted as text.
     * @type {Integer (Int32)}
     */
    static IEM_InsertText => 0

    /**
     * Drawn ink is inserted as ink.
     * @type {Integer (Int32)}
     */
    static IEM_InsertInk => 1
}
