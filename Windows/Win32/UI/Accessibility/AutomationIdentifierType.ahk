#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values used in the UiaLookupId function.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/ne-uiautomationcoreapi-automationidentifiertype
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class AutomationIdentifierType extends Win32Enum{

    /**
     * Specifies a property ID.
     * @type {Integer (Int32)}
     */
    static AutomationIdentifierType_Property => 0

    /**
     * Specifies a control pattern ID.
     * @type {Integer (Int32)}
     */
    static AutomationIdentifierType_Pattern => 1

    /**
     * Specifies an event ID.
     * @type {Integer (Int32)}
     */
    static AutomationIdentifierType_Event => 2

    /**
     * Specifies a control type ID.
     * @type {Integer (Int32)}
     */
    static AutomationIdentifierType_ControlType => 3

    /**
     * Specifies a text attribute ID.
     * @type {Integer (Int32)}
     */
    static AutomationIdentifierType_TextAttribute => 4

    /**
     * Specifies a landmark type ID.
     * @type {Integer (Int32)}
     */
    static AutomationIdentifierType_LandmarkType => 5

    /**
     * Specifies an annotation ID.
     * @type {Integer (Int32)}
     */
    static AutomationIdentifierType_Annotation => 6

    /**
     * Specifies a changes ID.
     * @type {Integer (Int32)}
     */
    static AutomationIdentifierType_Changes => 7

    /**
     * Specifies a style ID.
     * @type {Integer (Int32)}
     */
    static AutomationIdentifierType_Style => 8
}
