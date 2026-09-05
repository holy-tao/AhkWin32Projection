#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the value of the CapStyle text attribute.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-capstyle
 * @namespace Windows.Win32.UI.Accessibility
 */
class CapStyle extends Win32Enum {

    /**
     * None.
     * Native name: CapStyle_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Small capitals.
     * Native name: CapStyle_SmallCap
     * @type {Integer (Int32)}
     */
    static SmallCap => 1

    /**
     * All capitals.
     * Native name: CapStyle_AllCap
     * @type {Integer (Int32)}
     */
    static AllCap => 2

    /**
     * All petite capitals.
     * Native name: CapStyle_AllPetiteCaps
     * @type {Integer (Int32)}
     */
    static AllPetiteCaps => 3

    /**
     * Petite capitals.
     * Native name: CapStyle_PetiteCaps
     * @type {Integer (Int32)}
     */
    static PetiteCaps => 4

    /**
     * Single case.
     * Native name: CapStyle_Unicase
     * @type {Integer (Int32)}
     */
    static Unicase => 5

    /**
     * Title case.
     * Native name: CapStyle_Titling
     * @type {Integer (Int32)}
     */
    static Titling => 6

    /**
     * Native name: CapStyle_Other
     * @type {Integer (Int32)}
     */
    static Other => -1
}
