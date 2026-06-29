#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies values that identify the availability of a contextual tab.
 * @remarks
 * A contextual tab  is displayed based on the <b>UI_CONTEXTAVAILABILITY</b> value in <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-reference-properties-uipkey-contextavailable">UI_PKEY_ContextAvailable</a>.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/ne-uiribbon-ui_contextavailability
 * @namespace Windows.Win32.UI.Ribbon
 */
export default struct UI_CONTEXTAVAILABILITY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A contextual tab is not available for the selected object.
     * @type {Integer (Int32)}
     */
    static UI_CONTEXTAVAILABILITY_NOTAVAILABLE => 0

    /**
     * A contextual tab is available for the selected object. The tab is not the active tab.
     * @type {Integer (Int32)}
     */
    static UI_CONTEXTAVAILABILITY_AVAILABLE => 1

    /**
     * A contextual tab is available for the selected object. The tab is the active tab.
     * @type {Integer (Int32)}
     */
    static UI_CONTEXTAVAILABILITY_ACTIVE => 2
}
