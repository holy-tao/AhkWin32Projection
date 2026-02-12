#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the S/MIME type of an email message.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessagesmimekind
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMessageSmimeKind extends Win32Enum{

    /**
     * No MIME encryption or signature.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Clear signed MIME (two MIME entities).
     * @type {Integer (Int32)}
     */
    static ClearSigned => 1

    /**
     * Opaque signed MIME (a single MIME entity).
     * @type {Integer (Int32)}
     */
    static OpaqueSigned => 2

    /**
     * Encrypted MIME.
     * @type {Integer (Int32)}
     */
    static Encrypted => 3
}
