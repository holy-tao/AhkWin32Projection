#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies if the last batch access operation was successful or if there was a server error.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactbatchstatus
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactBatchStatus extends Win32Enum{

    /**
     * Success
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * There was a server error.
     * @type {Integer (Int32)}
     */
    static ServerSearchSyncManagerError => 1

    /**
     * There was an unknown error.
     * @type {Integer (Int32)}
     */
    static ServerSearchUnknownError => 2
}
