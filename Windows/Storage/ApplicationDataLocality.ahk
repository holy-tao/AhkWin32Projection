#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Specifies the type of an application data store.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdatalocality
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class ApplicationDataLocality extends Win32Enum{

    /**
     * The data resides in the local application data store.
     * @type {Integer (Int32)}
     */
    static Local => 0

    /**
     * The data resides in the roaming application data store.
     * @type {Integer (Int32)}
     */
    static Roaming => 1

    /**
     * The data resides in the temporary application data store.
     * @type {Integer (Int32)}
     */
    static Temporary => 2

    /**
     * The data resides in the local cache for the application data store.
     * @type {Integer (Int32)}
     */
    static LocalCache => 3

    /**
     * The data resides in the shared local application data store.
     * @type {Integer (Int32)}
     */
    static SharedLocal => 4
}
