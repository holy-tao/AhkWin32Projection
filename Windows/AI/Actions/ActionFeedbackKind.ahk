#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the kind of user feedback represented by an [ActionFeedback](actionfeedback.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionfeedbackkind
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class ActionFeedbackKind extends Win32Enum{

    /**
     * The user feedback is positive.
     * @type {Integer (Int32)}
     */
    static Positive => 0

    /**
     * The user feedback is negative.
     * @type {Integer (Int32)}
     */
    static Negative => 1
}
