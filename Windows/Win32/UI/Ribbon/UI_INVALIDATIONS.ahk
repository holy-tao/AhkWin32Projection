#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies values that identify the aspect of a Command to invalidate.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/ne-uiribbon-ui_invalidations
 * @namespace Windows.Win32.UI.Ribbon
 */
export default struct UI_INVALIDATIONS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A state property, such as <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-reference-properties-uipkey-enabled">UI_PKEY_Enabled</a>.
     * @type {Integer (Int32)}
     */
    static UI_INVALIDATIONS_STATE => 1

    /**
     * The value property of a Command.
     * @type {Integer (Int32)}
     */
    static UI_INVALIDATIONS_VALUE => 2

    /**
     * Any property.
     * @type {Integer (Int32)}
     */
    static UI_INVALIDATIONS_PROPERTY => 4

    /**
     * All properties.
     * @type {Integer (Int32)}
     */
    static UI_INVALIDATIONS_ALLPROPERTIES => 8
}
