#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the type of response to an email message.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessageresponsekind
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMessageResponseKind extends Win32Enum{

    /**
     * The email message is not a response to another email message.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The email message is a reply to the sender of another email message.
     * @type {Integer (Int32)}
     */
    static Reply => 1

    /**
     * The email message is a reply to the sender and all addressees of another email message.
     * @type {Integer (Int32)}
     */
    static ReplyAll => 2

    /**
     * The email message is a forwarded copy of another email message.
     * @type {Integer (Int32)}
     */
    static Forward => 3
}
