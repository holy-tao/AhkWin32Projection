#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values used in the UiaLookupId function.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/ne-uiautomationcoreapi-automationidentifiertype
 * @namespace Windows.Win32.UI.Accessibility
 */
class AutomationIdentifierType extends Win32Enum {

    /**
     * Specifies a property ID.
     * Native name: AutomationIdentifierType_Property
     * @type {Integer (Int32)}
     */
    static Property => 0

    /**
     * Specifies a control pattern ID.
     * Native name: AutomationIdentifierType_Pattern
     * @type {Integer (Int32)}
     */
    static Pattern => 1

    /**
     * Specifies an event ID.
     * Native name: AutomationIdentifierType_Event
     * @type {Integer (Int32)}
     */
    static Event => 2

    /**
     * Specifies a control type ID.
     * Native name: AutomationIdentifierType_ControlType
     * @type {Integer (Int32)}
     */
    static ControlType => 3

    /**
     * Specifies a text attribute ID.
     * Native name: AutomationIdentifierType_TextAttribute
     * @type {Integer (Int32)}
     */
    static TextAttribute => 4

    /**
     * Specifies a landmark type ID.
     * Native name: AutomationIdentifierType_LandmarkType
     * @type {Integer (Int32)}
     */
    static LandmarkType => 5

    /**
     * Specifies an annotation ID.
     * Native name: AutomationIdentifierType_Annotation
     * @type {Integer (Int32)}
     */
    static Annotation => 6

    /**
     * Specifies a changes ID.
     * Native name: AutomationIdentifierType_Changes
     * @type {Integer (Int32)}
     */
    static Changes => 7

    /**
     * Specifies a style ID.
     * Native name: AutomationIdentifierType_Style
     * @type {Integer (Int32)}
     */
    static Style => 8
}
