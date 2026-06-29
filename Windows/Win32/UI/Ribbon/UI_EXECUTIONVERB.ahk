#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies values that identify the execution IDs that map to actions a user can initiate on a Command.
 * @remarks
 * In the Ribbon framework, user actions are called executions. 
 * 
 * For example, if a user hovers the mouse over a gallery item,  UI_EXECUTIONVERB_PREVIEW is passed in a call to the <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nf-uiribbon-iuicommandhandler-execute">IUICommandHandler::Execute</a> function of the gallery to indicate that  a live preview event occurred on the item.  If the user clicks the gallery item, UI_EXECUTIONVERB_EXECUTE is passed in a subsequent call to the <b>IUICommandHandler::Execute</b> function to indicate that the item was executed.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/ne-uiribbon-ui_executionverb
 * @namespace Windows.Win32.UI.Ribbon
 */
export default struct UI_EXECUTIONVERB {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Execute a command.
     * @type {Integer (Int32)}
     */
    static UI_EXECUTIONVERB_EXECUTE => 0

    /**
     * Show a preview of a visual element.
     * @type {Integer (Int32)}
     */
    static UI_EXECUTIONVERB_PREVIEW => 1

    /**
     * Cancel a preview of a visual element.
     * @type {Integer (Int32)}
     */
    static UI_EXECUTIONVERB_CANCELPREVIEW => 2
}
