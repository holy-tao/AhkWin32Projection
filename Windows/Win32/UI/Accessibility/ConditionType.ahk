#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify a type of UiaCondition.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcoreapi/ne-uiautomationcoreapi-conditiontype
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ConditionType extends Win32Enum{

    /**
     * A condition that is true.
     * @type {Integer (Int32)}
     */
    static ConditionType_True => 0

    /**
     * A condition that is false.
     * @type {Integer (Int32)}
     */
    static ConditionType_False => 1

    /**
     * A property condition.
     * @type {Integer (Int32)}
     */
    static ConditionType_Property => 2

    /**
     * A complex condition where all the contained conditions must be true.
     * @type {Integer (Int32)}
     */
    static ConditionType_And => 3

    /**
     * A complex condition where at least one of the contained conditions must be true.
     * @type {Integer (Int32)}
     */
    static ConditionType_Or => 4

    /**
     * A condition that is true if the specified conditions are not met.
     * @type {Integer (Int32)}
     */
    static ConditionType_Not => 5
}
