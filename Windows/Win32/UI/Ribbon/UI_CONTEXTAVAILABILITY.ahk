#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies values that identify the availability of a contextual tab.
 * @remarks
 * A contextual tab  is displayed based on the <b>UI_CONTEXTAVAILABILITY</b> value in <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-reference-properties-uipkey-contextavailable">UI_PKEY_ContextAvailable</a>.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/ne-uiribbon-ui_contextavailability
 * @namespace Windows.Win32.UI.Ribbon
 */
class UI_CONTEXTAVAILABILITY extends Win32Enum {

    /**
     * A contextual tab is not available for the selected object.
     * Native name: UI_CONTEXTAVAILABILITY_NOTAVAILABLE
     * @type {Integer (Int32)}
     */
    static NOTAVAILABLE => 0

    /**
     * A contextual tab is available for the selected object. The tab is not the active tab.
     * Native name: UI_CONTEXTAVAILABILITY_AVAILABLE
     * @type {Integer (Int32)}
     */
    static AVAILABLE => 1

    /**
     * A contextual tab is available for the selected object. The tab is the active tab.
     * Native name: UI_CONTEXTAVAILABILITY_ACTIVE
     * @type {Integer (Int32)}
     */
    static ACTIVE => 2
}
