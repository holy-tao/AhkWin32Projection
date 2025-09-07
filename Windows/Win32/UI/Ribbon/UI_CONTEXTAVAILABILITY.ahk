#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies values that identify the availability of a contextual tab.
 * @remarks
 * A contextual tab  is displayed based on the <b>UI_CONTEXTAVAILABILITY</b> value in <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-reference-properties-uipkey-contextavailable">UI_PKEY_ContextAvailable</a>.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/ne-uiribbon-ui_contextavailability
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class UI_CONTEXTAVAILABILITY{

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
