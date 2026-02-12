#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values that describe the operation being performed for the current package in the download and installation queue.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storequeueitemkind
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreQueueItemKind extends Win32Enum{

    /**
     * The item is being installed for the first time.
     * @type {Integer (Int32)}
     */
    static Install => 0

    /**
     * The item is being updated.
     * @type {Integer (Int32)}
     */
    static Update => 1

    /**
     * The item is being repaired.
     * @type {Integer (Int32)}
     */
    static Repair => 2
}
