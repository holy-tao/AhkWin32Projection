#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the download status of an email message.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessagedownloadstate
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMessageDownloadState extends Win32Enum{

    /**
     * The email message is partially downloaded.
     * @type {Integer (Int32)}
     */
    static PartiallyDownloaded => 0

    /**
     * The email message is currently downloading.
     * @type {Integer (Int32)}
     */
    static Downloading => 1

    /**
     * The download of the email message is complete.
     * @type {Integer (Int32)}
     */
    static Downloaded => 2

    /**
     * The download of the email message has failed.
     * @type {Integer (Int32)}
     */
    static Failed => 3
}
