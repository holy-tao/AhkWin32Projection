#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies which mouse button was pressed. (MouseButton)
 * @see https://learn.microsoft.com/windows/win32/api/inked/ne-inked-mousebutton
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct MouseButton {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Default. No mouse button was pressed.
     * @type {Integer (Int32)}
     */
    static NO_BUTTON => 0

    /**
     * The left mouse button was pressed.
     * @type {Integer (Int32)}
     */
    static LEFT_BUTTON => 1

    /**
     * The right mouse button was pressed.
     * @type {Integer (Int32)}
     */
    static RIGHT_BUTTON => 2

    /**
     * The middle mouse button was pressed.
     * @type {Integer (Int32)}
     */
    static MIDDLE_BUTTON => 4
}
