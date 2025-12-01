#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values for the OutlineStyle text attribute.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-outlinestyles
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class OutlineStyles extends Win32Enum{

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
