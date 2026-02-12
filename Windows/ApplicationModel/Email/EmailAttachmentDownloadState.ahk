#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the states of an email attachment download.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailattachmentdownloadstate
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailAttachmentDownloadState extends Win32Enum{

    /**
     * The attachment is not yet downloaded.
     * @type {Integer (Int32)}
     */
    static NotDownloaded => 0

    /**
     * The attachment is currently downloading.
     * @type {Integer (Int32)}
     */
    static Downloading => 1

    /**
     * The attachment has been downloaded.
     * @type {Integer (Int32)}
     */
    static Downloaded => 2

    /**
     * The attachment has failed.
     * @type {Integer (Int32)}
     */
    static Failed => 3
}
