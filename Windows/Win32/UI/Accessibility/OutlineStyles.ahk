#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values for the OutlineStyle text attribute.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-outlinestyles
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct OutlineStyles {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No outline style.
     * @type {Integer (Int32)}
     */
    static OutlineStyles_None => 0

    /**
     * A simple outline.
     * @type {Integer (Int32)}
     */
    static OutlineStyles_Outline => 1

    /**
     * A shadow.
     * @type {Integer (Int32)}
     */
    static OutlineStyles_Shadow => 2

    /**
     * An engraved appearance.
     * @type {Integer (Int32)}
     */
    static OutlineStyles_Engraved => 4

    /**
     * An embossed appearance.
     * @type {Integer (Int32)}
     */
    static OutlineStyles_Embossed => 8
}
