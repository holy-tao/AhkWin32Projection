#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the encoding schema used for automatic replies.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxautoreplymessageresponsekind
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMailboxAutoReplyMessageResponseKind extends Win32Enum{

    /**
     * The autoreply message is encoded as HTML.
     * @type {Integer (Int32)}
     */
    static Html => 0

    /**
     * The autoreply message is encoded as plain text.
     * @type {Integer (Int32)}
     */
    static PlainText => 1
}
