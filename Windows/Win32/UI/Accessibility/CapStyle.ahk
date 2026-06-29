#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that specify the value of the CapStyle text attribute.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-capstyle
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct CapStyle {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * None.
     * @type {Integer (Int32)}
     */
    static CapStyle_None => 0

    /**
     * Small capitals.
     * @type {Integer (Int32)}
     */
    static CapStyle_SmallCap => 1

    /**
     * All capitals.
     * @type {Integer (Int32)}
     */
    static CapStyle_AllCap => 2

    /**
     * All petite capitals.
     * @type {Integer (Int32)}
     */
    static CapStyle_AllPetiteCaps => 3

    /**
     * Petite capitals.
     * @type {Integer (Int32)}
     */
    static CapStyle_PetiteCaps => 4

    /**
     * Single case.
     * @type {Integer (Int32)}
     */
    static CapStyle_Unicase => 5

    /**
     * Title case.
     * @type {Integer (Int32)}
     */
    static CapStyle_Titling => 6

    /**
     * @type {Integer (Int32)}
     */
    static CapStyle_Other => -1
}
