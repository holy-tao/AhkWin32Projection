#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Gets the result status for the rate and review request for the product.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storerateandreviewstatus
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreRateAndReviewStatus extends Win32Enum{

    /**
     * The request was successful.
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * The request was canceled by the user.
     * @type {Integer (Int32)}
     */
    static CanceledByUser => 1

    /**
     * The request encountered a network error.
     * @type {Integer (Int32)}
     */
    static NetworkError => 2

    /**
     * The request encountered an error.
     * @type {Integer (Int32)}
     */
    static Error => 3
}
