#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The type of store you want to retrieve.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistorystoreaccesstype
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneCallHistoryStoreAccessType extends Win32Enum{

    /**
     * Only entries created by this application should have read and write permissions.
     * @type {Integer (Int32)}
     */
    static AppEntriesReadWrite => 0

    /**
     * All of the entries should have limited read and write permissions.
     * @type {Integer (Int32)}
     */
    static AllEntriesLimitedReadWrite => 1

    /**
     * All the entries should have full read and write permissions.
     * @type {Integer (Int32)}
     */
    static AllEntriesReadWrite => 2
}
