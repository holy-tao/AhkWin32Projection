#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Provides a set of flags to be used with IAttachmentExecute::Prompt to indicate the action to be performed upon user confirmation.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-attachment_action
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ATTACHMENT_ACTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Cancel
     * @type {Integer (Int32)}
     */
    static ATTACHMENT_ACTION_CANCEL => 0

    /**
     * Save
     * @type {Integer (Int32)}
     */
    static ATTACHMENT_ACTION_SAVE => 1

    /**
     * Execute
     * @type {Integer (Int32)}
     */
    static ATTACHMENT_ACTION_EXEC => 2
}
