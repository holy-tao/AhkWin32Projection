#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values that represent the status of an request that is related to a consumable add-on.
 * @remarks
 * The [StoreConsumableResult.Status](storeconsumableresult_status.md) property returns StoreConsumableStatus values.
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeconsumablestatus
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreConsumableStatus extends Win32Enum{

    /**
     * The request succeeded.
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * The request did not succeed because the remaining balance of the consumable add-on is too low.
     * @type {Integer (Int32)}
     */
    static InsufficentQuantity => 1

    /**
     * The request did not succeed because of a network connectivity error.
     * @type {Integer (Int32)}
     */
    static NetworkError => 2

    /**
     * The request did not succeed because of a server error returned by the Microsoft Store.
     * @type {Integer (Int32)}
     */
    static ServerError => 3
}
