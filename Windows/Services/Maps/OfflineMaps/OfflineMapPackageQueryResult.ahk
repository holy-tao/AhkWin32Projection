#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IOfflineMapPackageQueryResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the result of a query for map packages.
 * @remarks
 * You can query your system for map data by using the [FindPackagesAsync](offlinemappackage_findpackagesasync_1312242741.md), [FindPackagesInBoundingBoxAsync](offlinemappackage_findpackagesinboundingboxasync_121221617.md), and [FindPackagesInGeocircleAsync](offlinemappackage_findpackagesingeocircleasync_917543629.md) methods.
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.offlinemaps.offlinemappackagequeryresult
 * @namespace Windows.Services.Maps.OfflineMaps
 * @version WindowsRuntime 1.4
 */
class OfflineMapPackageQueryResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IOfflineMapPackageQueryResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IOfflineMapPackageQueryResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the success or failure of the query to find map packages.
     * @remarks
     * If the status is *Success*, then use the [Packages](offlinemappackagequeryresult_packages.md) property to obtain the list of map packages that were found as a result of the query.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.offlinemaps.offlinemappackagequeryresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the map packages returned by a call to the [FindPackagesAsync](offlinemappackage_findpackagesasync_1312242741.md), [FindPackagesInBoundingBoxAsync](offlinemappackage_findpackagesinboundingboxasync_121221617.md), and [FindPackagesInGeocircleAsync](offlinemappackage_findpackagesingeocircleasync_917543629.md) methods.
     * @remarks
     * Before using the Packages property, use the [Status](offlinemappackagequeryresult_status.md) to determine if the query is successful.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.offlinemaps.offlinemappackagequeryresult.packages
     * @type {IVectorView<OfflineMapPackage>} 
     */
    Packages {
        get => this.get_Packages()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IOfflineMapPackageQueryResult")) {
            if ((queryResult := this.QueryInterface(IOfflineMapPackageQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOfflineMapPackageQueryResult := IOfflineMapPackageQueryResult(outPtr)
        }

        return this.__IOfflineMapPackageQueryResult.get_Status()
    }

    /**
     * 
     * @returns {IVectorView<OfflineMapPackage>} 
     */
    get_Packages() {
        if (!this.HasProp("__IOfflineMapPackageQueryResult")) {
            if ((queryResult := this.QueryInterface(IOfflineMapPackageQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOfflineMapPackageQueryResult := IOfflineMapPackageQueryResult(outPtr)
        }

        return this.__IOfflineMapPackageQueryResult.get_Packages()
    }

;@endregion Instance Methods
}
