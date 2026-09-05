#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Provides a set of flags to be used with IAttachmentExecute::Prompt to indicate the action to be performed upon user confirmation.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-attachment_action
 * @namespace Windows.Win32.UI.Shell
 */
class ATTACHMENT_ACTION extends Win32Enum {

    /**
     * Cancel
     * Native name: ATTACHMENT_ACTION_CANCEL
     * @type {Integer (Int32)}
     */
    static CANCEL => 0

    /**
     * Save
     * Native name: ATTACHMENT_ACTION_SAVE
     * @type {Integer (Int32)}
     */
    static SAVE => 1

    /**
     * Execute
     * Native name: ATTACHMENT_ACTION_EXEC
     * @type {Integer (Int32)}
     */
    static EXEC => 2
}
