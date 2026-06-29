#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PropertyConditionFlags (uiautomationclient.h) enumeration contains values used in creating property conditions.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/ne-uiautomationclient-propertyconditionflags
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct PropertyConditionFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
