#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify a type of UiaCondition.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/ne-uiautomationcoreapi-conditiontype
 * @namespace Windows.Win32.UI.Accessibility
 */
class ConditionType extends Win32Enum {

    /**
     * A condition that is true.
     * Native name: ConditionType_True
     * @type {Integer (Int32)}
     */
    static True => 0

    /**
     * A condition that is false.
     * Native name: ConditionType_False
     * @type {Integer (Int32)}
     */
    static False => 1

    /**
     * A property condition.
     * Native name: ConditionType_Property
     * @type {Integer (Int32)}
     */
    static Property => 2

    /**
     * A complex condition where all the contained conditions must be true.
     * Native name: ConditionType_And
     * @type {Integer (Int32)}
     */
    static And => 3

    /**
     * A complex condition where at least one of the contained conditions must be true.
     * Native name: ConditionType_Or
     * @type {Integer (Int32)}
     */
    static Or => 4

    /**
     * A condition that is true if the specified conditions are not met.
     * Native name: ConditionType_Not
     * @type {Integer (Int32)}
     */
    static Not => 5
}
