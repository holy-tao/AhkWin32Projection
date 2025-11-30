#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies values that identify the aspect of a Command to invalidate.
 * @see https://docs.microsoft.com/windows/win32/api//uiribbon/ne-uiribbon-ui_invalidations
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class UI_INVALIDATIONS extends Win32BitflagEnum{

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
