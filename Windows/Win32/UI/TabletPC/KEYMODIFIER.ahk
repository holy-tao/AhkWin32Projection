#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Determines which, if any, modifier keys were pressed when the flick gesture occurred.
 * @see https://learn.microsoft.com/windows/win32/api/tabflicks/ne-tabflicks-keymodifier
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct KEYMODIFIER {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The Control key was pressed when the Flicks gesture occurred.
     * @type {Integer (Int32)}
     */
    static KEYMODIFIER_CONTROL => 1

    /**
     * The Menu key was pressed when the Flicks gesture occurred.
     * @type {Integer (Int32)}
     */
    static KEYMODIFIER_MENU => 2

    /**
     * The Shift key was pressed when the Flicks gesture occurred.
     * @type {Integer (Int32)}
     */
    static KEYMODIFIER_SHIFT => 4

    /**
     * The Windows key was pressed when the Flicks gesture occurred.
     * @type {Integer (Int32)}
     */
    static KEYMODIFIER_WIN => 8

    /**
     * The Alt key was pressed when the Flicks gesture occurred.
     * @type {Integer (Int32)}
     */
    static KEYMODIFIER_ALTGR => 16

    /**
     * The pressed key's scan code was preceded by a prefix byte that has the value 0xE0 (224).
     * @type {Integer (Int32)}
     */
    static KEYMODIFIER_EXT => 32
}
