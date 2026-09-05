#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values for the OutlineStyle text attribute.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-outlinestyles
 * @namespace Windows.Win32.UI.Accessibility
 */
class OutlineStyles extends Win32Enum {

    /**
     * No outline style.
     * Native name: OutlineStyles_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * A simple outline.
     * Native name: OutlineStyles_Outline
     * @type {Integer (Int32)}
     */
    static Outline => 1

    /**
     * A shadow.
     * Native name: OutlineStyles_Shadow
     * @type {Integer (Int32)}
     */
    static Shadow => 2

    /**
     * An engraved appearance.
     * Native name: OutlineStyles_Engraved
     * @type {Integer (Int32)}
     */
    static Engraved => 4

    /**
     * An embossed appearance.
     * Native name: OutlineStyles_Embossed
     * @type {Integer (Int32)}
     */
    static Embossed => 8
}
