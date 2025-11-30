#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Returned by GetThemePropertyOrigin to specify where a property was found.
 * @see https://docs.microsoft.com/windows/win32/api//uxtheme/ne-uxtheme-propertyorigin
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class PROPERTYORIGIN extends Win32Enum{

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
