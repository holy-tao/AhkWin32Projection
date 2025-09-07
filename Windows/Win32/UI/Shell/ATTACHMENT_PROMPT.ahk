#Requires AutoHotkey v2.0.0 64-bit

/**
 * Provides a set of flags to be used with IAttachmentExecute::Prompt to indicate the type of prompt UI to display.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-attachment_prompt
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ATTACHMENT_PROMPT{

    /**
     * Do not use.
     * @type {Integer (Int32)}
     */
    static ATTACHMENT_PROMPT_NONE => 0

    /**
     * Displays a prompt asking whether the user would like to save the attachment.
     * @type {Integer (Int32)}
     */
    static ATTACHMENT_PROMPT_SAVE => 1

    /**
     * Displays a prompt asking whether the user would like to execute the attachment.
     * @type {Integer (Int32)}
     */
    static ATTACHMENT_PROMPT_EXEC => 2

    /**
     * Displays a prompt giving the user a choice of executing or saving the attachment.
     * @type {Integer (Int32)}
     */
    static ATTACHMENT_PROMPT_EXEC_OR_SAVE => 3
}
