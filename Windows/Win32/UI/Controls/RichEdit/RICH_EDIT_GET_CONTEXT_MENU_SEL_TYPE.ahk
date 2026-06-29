#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct RICH_EDIT_GET_CONTEXT_MENU_SEL_TYPE {
    value : UInt16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt16)}
     */
    static SEL_EMPTY => 0

    /**
     * @type {Integer (UInt16)}
     */
    static SEL_TEXT => 1

    /**
     * @type {Integer (UInt16)}
     */
    static SEL_OBJECT => 2

    /**
     * @type {Integer (UInt16)}
     */
    static SEL_MULTICHAR => 4

    /**
     * @type {Integer (UInt16)}
     */
    static SEL_MULTIOBJECT => 8

    /**
     * @type {Integer (UInt16)}
     */
    static GCM_RIGHTMOUSEDROP => 32768
}
