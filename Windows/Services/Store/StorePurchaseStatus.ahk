#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values that represent the status of a request to purchase an app or add-on.
 * @remarks
 * The [StorePurchaseResult.Status](storepurchaseresult_status.md) property returns these values.
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storepurchasestatus
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StorePurchaseStatus extends Win32Enum{

    /**
     * The purchase request succeeded.
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * The current user has already purchased the specified app or add-on.
     * @type {Integer (Int32)}
     */
    static AlreadyPurchased => 1

    /**
     * The purchase request did not succeed.
     * @type {Integer (Int32)}
     */
    static NotPurchased => 2

    /**
     * The purchase request did not succeed because of a network connectivity error.
     * @type {Integer (Int32)}
     */
    static NetworkError => 3

    /**
     * The purchase request did not succeed because of a server error returned by the Microsoft Store.
     * @type {Integer (Int32)}
     */
    static ServerError => 4
}
