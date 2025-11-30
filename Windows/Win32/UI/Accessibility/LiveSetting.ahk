#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains possible values for the LiveSetting property. This property is implemented by provider elements that are part of a live region.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/ne-uiautomationcore-livesetting
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class LiveSetting extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static Off => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static Polite => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static Assertive => 2
}
