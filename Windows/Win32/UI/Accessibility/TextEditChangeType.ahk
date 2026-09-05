#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the text editing change being performed by controls when text-edit events are raised or handled.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-texteditchangetype
 * @namespace Windows.Win32.UI.Accessibility
 */
class TextEditChangeType extends Win32Enum {

    /**
     * Not related to a specific change type.
     * Native name: TextEditChangeType_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Change is from an auto-correct action performed by a control.
     * Native name: TextEditChangeType_AutoCorrect
     * @type {Integer (Int32)}
     */
    static AutoCorrect => 1

    /**
     * Change is from an IME active composition within a control.
     * Native name: TextEditChangeType_Composition
     * @type {Integer (Int32)}
     */
    static Composition => 2

    /**
     * Change is from an IME composition going from active to finalized state within a control.
     * 
     * <div class="alert"><b>Note</b>  The finalized string may be empty if composition was canceled or deleted.</div>
     * <div> </div>
     * Native name: TextEditChangeType_CompositionFinalized
     * @type {Integer (Int32)}
     */
    static CompositionFinalized => 3

    /**
     * Native name: TextEditChangeType_AutoComplete
     * @type {Integer (Int32)}
     */
    static AutoComplete => 4
}
