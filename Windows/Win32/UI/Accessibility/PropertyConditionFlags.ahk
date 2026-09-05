#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PropertyConditionFlags (uiautomationclient.h) enumeration contains values used in creating property conditions.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/ne-uiautomationclient-propertyconditionflags
 * @namespace Windows.Win32.UI.Accessibility
 */
class PropertyConditionFlags extends Win32Enum {

    /**
     * No flags.
     * Native name: PropertyConditionFlags_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Comparison of string properties is not case-sensitive.
     * Native name: PropertyConditionFlags_IgnoreCase
     * @type {Integer (Int32)}
     */
    static IgnoreCase => 1

    /**
     * [Windows 10 October 2018 Update (version 1809) and newer]
     * 
     * Comparison of substring properties is enabled.
     * Native name: PropertyConditionFlags_MatchSubstring
     * @type {Integer (Int32)}
     */
    static MatchSubstring => 2
}
