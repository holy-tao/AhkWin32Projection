#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the kind of action to be taken.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxactionkind
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMailboxActionKind extends Win32Enum{

    /**
     * Mark the email message as seen.
     * @type {Integer (Int32)}
     */
    static MarkMessageAsSeen => 0

    /**
     * Mark the email message as having been read.
     * @type {Integer (Int32)}
     */
    static MarkMessageRead => 1

    /**
     * Change the flag state on the email message.
     * @type {Integer (Int32)}
     */
    static ChangeMessageFlagState => 2

    /**
     * Move the email message.
     * @type {Integer (Int32)}
     */
    static MoveMessage => 3

    /**
     * Save a draft of the email message.
     * @type {Integer (Int32)}
     */
    static SaveDraft => 4

    /**
     * Send the email message.
     * @type {Integer (Int32)}
     */
    static SendMessage => 5

    /**
     * Create a reply email message addressed to the sender in response to this email message.
     * @type {Integer (Int32)}
     */
    static CreateResponseReplyMessage => 6

    /**
     * Create a reply email message addressed to the sender and all recipients in response to this email message.
     * @type {Integer (Int32)}
     */
    static CreateResponseReplyAllMessage => 7

    /**
     * Create an email message to be forwarded containing the content of this email message.
     * @type {Integer (Int32)}
     */
    static CreateResponseForwardMessage => 8

    /**
     * Move this folder.
     * @type {Integer (Int32)}
     */
    static MoveFolder => 9

    /**
     * Enable sync for this folder.
     * @type {Integer (Int32)}
     */
    static MarkFolderForSyncEnabled => 10
}
