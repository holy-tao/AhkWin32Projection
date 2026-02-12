#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the format of an email message.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessagebodykind
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMessageBodyKind extends Win32Enum{

    /**
     * The email message is formatted as HTML.
     * @type {Integer (Int32)}
     */
    static Html => 0

    /**
     * The email message is formatted as plain text.
     * @type {Integer (Int32)}
     */
    static PlainText => 1
}
