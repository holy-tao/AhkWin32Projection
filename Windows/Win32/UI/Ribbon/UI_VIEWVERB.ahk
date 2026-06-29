#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies values that identify the type of action to complete on a Ribbon framework View.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/ne-uiribbon-ui_viewverb
 * @namespace Windows.Win32.UI.Ribbon
 */
export default struct UI_VIEWVERB {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Create a View.
     * @type {Integer (Int32)}
     */
    static UI_VIEWVERB_CREATE => 0

    /**
     * Destroy a View.
     * @type {Integer (Int32)}
     */
    static UI_VIEWVERB_DESTROY => 1

    /**
     * Resize a View.
     * @type {Integer (Int32)}
     */
    static UI_VIEWVERB_SIZE => 2

    /**
     * Unable to complete the action.
     * @type {Integer (Int32)}
     */
    static UI_VIEWVERB_ERROR => 3
}
