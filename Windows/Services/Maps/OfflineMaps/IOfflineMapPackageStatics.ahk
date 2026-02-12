#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\OfflineMapPackageQueryResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps.OfflineMaps
 * @version WindowsRuntime 1.4
 */
class IOfflineMapPackageStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineMapPackageStatics
     * @type {Guid}
     */
    static IID => Guid("{185e7922-a831-4ab0-941f-6998fa929285}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindPackagesAsync", "FindPackagesInBoundingBoxAsync", "FindPackagesInGeocircleAsync"]

    /**
     * 
     * @param {Geopoint} queryPoint 
     * @returns {IAsyncOperation<OfflineMapPackageQueryResult>} 
     */
    FindPackagesAsync(queryPoint) {
        result := ComCall(6, this, "ptr", queryPoint, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(OfflineMapPackageQueryResult, result_)
    }

    /**
     * 
     * @param {GeoboundingBox} queryBoundingBox 
     * @returns {IAsyncOperation<OfflineMapPackageQueryResult>} 
     */
    FindPackagesInBoundingBoxAsync(queryBoundingBox) {
        result := ComCall(7, this, "ptr", queryBoundingBox, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(OfflineMapPackageQueryResult, result_)
    }

    /**
     * 
     * @param {Geocircle} queryCircle 
     * @returns {IAsyncOperation<OfflineMapPackageQueryResult>} 
     */
    FindPackagesInGeocircleAsync(queryCircle) {
        result := ComCall(8, this, "ptr", queryCircle, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(OfflineMapPackageQueryResult, result_)
    }
}
