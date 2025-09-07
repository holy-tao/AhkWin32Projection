#Requires AutoHotkey v2.0.0 64-bit

/**
 * The PropertyConditionFlags (uiautomationclient.h) enumeration contains values used in creating property conditions.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/ne-uiautomationclient-propertyconditionflags
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class PropertyConditionFlags{

    /**
     * No flags.
     * @type {Integer (Int32)}
     */
    static PropertyConditionFlags_None => 0

    /**
     * Comparison of string properties is not case-sensitive.
     * @type {Integer (Int32)}
     */
    static PropertyConditionFlags_IgnoreCase => 1

    /**
     * [Windows 10 October 2018 Update (version 1809) and newer]
 * 
 * Comparison of substring properties is enabled.
     * @type {Integer (Int32)}
     */
    static PropertyConditionFlags_MatchSubstring => 2
}
