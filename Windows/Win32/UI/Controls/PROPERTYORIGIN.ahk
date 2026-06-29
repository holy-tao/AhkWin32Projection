#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Returned by GetThemePropertyOrigin to specify where a property was found.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/ne-uxtheme-propertyorigin
 * @namespace Windows.Win32.UI.Controls
 */
export default struct PROPERTYORIGIN {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Property was found in the state section.
     * @type {Integer (Int32)}
     */
    static PO_STATE => 0

    /**
     * Property was found in the part section.
     * @type {Integer (Int32)}
     */
    static PO_PART => 1

    /**
     * Property was found in the class section.
     * @type {Integer (Int32)}
     */
    static PO_CLASS => 2

    /**
     * Property was found in the list of global variables.
     * @type {Integer (Int32)}
     */
    static PO_GLOBAL => 3

    /**
     * Property was not found.
     * @type {Integer (Int32)}
     */
    static PO_NOTFOUND => 4
}
