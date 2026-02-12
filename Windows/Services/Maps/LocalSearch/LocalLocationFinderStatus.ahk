#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the status of a search performed by the [FindLocalLocationsAsync](locallocationfinder_findlocallocationsasync_1108099862.md) method.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.locallocationfinderstatus
 * @namespace Windows.Services.Maps.LocalSearch
 * @version WindowsRuntime 1.4
 */
class LocalLocationFinderStatus extends Win32Enum{

    /**
     * The search completed successfully.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The search encountered an unknown error.
     * @type {Integer (Int32)}
     */
    static UnknownError => 1

    /**
     * The app does not have the credentials necessary to perform the search.
     * @type {Integer (Int32)}
     */
    static InvalidCredentials => 2

    /**
     * One or more of the specified categories are not valid.
     * @type {Integer (Int32)}
     */
    static InvalidCategory => 3

    /**
     * The specified search text is not valid.
     * @type {Integer (Int32)}
     */
    static InvalidSearchTerm => 4

    /**
     * The specified geographic area is not valid.
     * @type {Integer (Int32)}
     */
    static InvalidSearchArea => 5

    /**
     * The search encountered a network failure.
     * @type {Integer (Int32)}
     */
    static NetworkFailure => 6

    /**
     * The search is not supported on this device.
     * @type {Integer (Int32)}
     */
    static NotSupported => 7
}
