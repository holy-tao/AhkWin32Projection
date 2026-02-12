#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values that represent the license status for a downloadable content (DLC) add-on package.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecanlicensestatus
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreCanLicenseStatus extends Win32Enum{

    /**
     * The user doesn't have the right to acquire a license for the product.
     * @type {Integer (Int32)}
     */
    static NotLicensableToUser => 0

    /**
     * The product can be licensed to the current user.
     * @type {Integer (Int32)}
     */
    static Licensable => 1

    /**
     * The product is not individually licensable. For example, this can occur if you pass a Store ID to the [CanAcquireStoreLicenseAsync(String)](storecontext_canacquirestorelicenseasync_871232308.md) method for a non-DLC add-on (that is, an add-on without a package).
     * @type {Integer (Int32)}
     */
    static LicenseActionNotApplicableToProduct => 2

    /**
     * The license request did not succeed because of a network connectivity error.
     * @type {Integer (Int32)}
     */
    static NetworkError => 3

    /**
     * The license request did not succeed because of a server error returned by the Microsoft Store.
     * @type {Integer (Int32)}
     */
    static ServerError => 4
}
