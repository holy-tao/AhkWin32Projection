#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the text editing change being performed by controls when text-edit events are raised or handled.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-texteditchangetype
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class TextEditChangeType{

    /**
     * Not related to a specific change type.
     * @type {Integer (Int32)}
     */
    static TextEditChangeType_None => 0

    /**
     * Change is from an auto-correct action performed by a control.
     * @type {Integer (Int32)}
     */
    static TextEditChangeType_AutoCorrect => 1

    /**
     * Change is from an IME active composition within a control.
     * @type {Integer (Int32)}
     */
    static TextEditChangeType_Composition => 2

    /**
     * Change is from an IME composition going from active to finalized state within a control.
 * 
 * <div class="alert"><b>Note</b>  The finalized string may be empty if composition was canceled or deleted.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static TextEditChangeType_CompositionFinalized => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static TextEditChangeType_AutoComplete => 4
}
