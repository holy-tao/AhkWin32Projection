#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the states of an email batch operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailbatchstatus
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailBatchStatus extends Win32Enum{

    /**
     * The batch operation has completed successfully.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The batch operation has failed due to a sync manager error.
     * @type {Integer (Int32)}
     */
    static ServerSearchSyncManagerError => 1

    /**
     * The batch operation has failed due to an unknown error.
     * @type {Integer (Int32)}
     */
    static ServerSearchUnknownError => 2
}
