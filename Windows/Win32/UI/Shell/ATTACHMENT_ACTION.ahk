#Requires AutoHotkey v2.0.0 64-bit

/**
 * Provides a set of flags to be used with IAttachmentExecute::Prompt to indicate the action to be performed upon user confirmation.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-attachment_action
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ATTACHMENT_ACTION{

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
