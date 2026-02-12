#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values that specify the state of a new or updated package that is in the download and installation queue for the current app.
 * @remarks
 * [StoreQueueItemExtendedState](storequeueitemextendedstate.md)
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storequeueitemstate
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreQueueItemState extends Win32Enum{

    /**
     * The download or installation of the package is in progress.
     * @type {Integer (Int32)}
     */
    static Active => 0

    /**
     * The download and installation of the package completed.
     * @type {Integer (Int32)}
     */
    static Completed => 1

    /**
     * The download or installation of the package was canceled.
     * @type {Integer (Int32)}
     */
    static Canceled => 2

    /**
     * The download or installation of the package encountered an error.
     * @type {Integer (Int32)}
     */
    static Error => 3

    /**
     * The download or installation of the package was paused.
     * @type {Integer (Int32)}
     */
    static Paused => 4
}
