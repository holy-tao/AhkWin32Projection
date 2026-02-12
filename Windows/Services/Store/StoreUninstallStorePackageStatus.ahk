#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values that represent the status of a package uninstall request.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeuninstallstorepackagestatus
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreUninstallStorePackageStatus extends Win32Enum{

    /**
     * The uninstall operation succeeded.
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * The uninstall operation was canceled by the user.
     * @type {Integer (Int32)}
     */
    static CanceledByUser => 1

    /**
     * The uninstall operation did not succeed because of a network connectivity error.
     * @type {Integer (Int32)}
     */
    static NetworkError => 2

    /**
     * The uninstall operation is not applicable to the specified package.
     * @type {Integer (Int32)}
     */
    static UninstallNotApplicable => 3

    /**
     * The uninstall operation did not succeed because of an unknown error.
     * @type {Integer (Int32)}
     */
    static Error => 4
}
