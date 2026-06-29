#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the text editing change being performed by controls when text-edit events are raised or handled.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-texteditchangetype
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct TextEditChangeType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
     * @type {Integer (Int32)}
     */
    static TextEditChangeType_AutoComplete => 4
}
