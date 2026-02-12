#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\MapRouteFinderResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class IMapRouteFinderStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapRouteFinderStatics
     * @type {Guid}
     */
    static IID => Guid("{b8a5c50f-1c64-4c3a-81eb-1f7c152afbbb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDrivingRouteAsync", "GetDrivingRouteWithOptimizationAsync", "GetDrivingRouteWithOptimizationAndRestrictionsAsync", "GetDrivingRouteWithOptimizationRestrictionsAndHeadingAsync", "GetDrivingRouteFromWaypointsAsync", "GetDrivingRouteFromWaypointsAndOptimizationAsync", "GetDrivingRouteFromWaypointsOptimizationAndRestrictionsAsync", "GetDrivingRouteFromWaypointsOptimizationRestrictionsAndHeadingAsync", "GetWalkingRouteAsync", "GetWalkingRouteFromWaypointsAsync"]

    /**
     * 
     * @param {Geopoint} startPoint 
     * @param {Geopoint} endPoint 
     * @returns {IAsyncOperation<MapRouteFinderResult>} 
     */
    GetDrivingRouteAsync(startPoint, endPoint) {
        result := ComCall(6, this, "ptr", startPoint, "ptr", endPoint, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MapRouteFinderResult, result_)
    }

    /**
     * 
     * @param {Geopoint} startPoint 
     * @param {Geopoint} endPoint 
     * @param {Integer} optimization 
     * @returns {IAsyncOperation<MapRouteFinderResult>} 
     */
    GetDrivingRouteWithOptimizationAsync(startPoint, endPoint, optimization) {
        result := ComCall(7, this, "ptr", startPoint, "ptr", endPoint, "int", optimization, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MapRouteFinderResult, result_)
    }

    /**
     * 
     * @param {Geopoint} startPoint 
     * @param {Geopoint} endPoint 
     * @param {Integer} optimization 
     * @param {Integer} restrictions_ 
     * @returns {IAsyncOperation<MapRouteFinderResult>} 
     */
    GetDrivingRouteWithOptimizationAndRestrictionsAsync(startPoint, endPoint, optimization, restrictions_) {
        result := ComCall(8, this, "ptr", startPoint, "ptr", endPoint, "int", optimization, "uint", restrictions_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MapRouteFinderResult, result_)
    }

    /**
     * 
     * @param {Geopoint} startPoint 
     * @param {Geopoint} endPoint 
     * @param {Integer} optimization 
     * @param {Integer} restrictions_ 
     * @param {Float} headingInDegrees 
     * @returns {IAsyncOperation<MapRouteFinderResult>} 
     */
    GetDrivingRouteWithOptimizationRestrictionsAndHeadingAsync(startPoint, endPoint, optimization, restrictions_, headingInDegrees) {
        result := ComCall(9, this, "ptr", startPoint, "ptr", endPoint, "int", optimization, "uint", restrictions_, "double", headingInDegrees, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MapRouteFinderResult, result_)
    }

    /**
     * 
     * @param {IIterable<Geopoint>} wayPoints 
     * @returns {IAsyncOperation<MapRouteFinderResult>} 
     */
    GetDrivingRouteFromWaypointsAsync(wayPoints) {
        result := ComCall(10, this, "ptr", wayPoints, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MapRouteFinderResult, result_)
    }

    /**
     * 
     * @param {IIterable<Geopoint>} wayPoints 
     * @param {Integer} optimization 
     * @returns {IAsyncOperation<MapRouteFinderResult>} 
     */
    GetDrivingRouteFromWaypointsAndOptimizationAsync(wayPoints, optimization) {
        result := ComCall(11, this, "ptr", wayPoints, "int", optimization, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MapRouteFinderResult, result_)
    }

    /**
     * 
     * @param {IIterable<Geopoint>} wayPoints 
     * @param {Integer} optimization 
     * @param {Integer} restrictions_ 
     * @returns {IAsyncOperation<MapRouteFinderResult>} 
     */
    GetDrivingRouteFromWaypointsOptimizationAndRestrictionsAsync(wayPoints, optimization, restrictions_) {
        result := ComCall(12, this, "ptr", wayPoints, "int", optimization, "uint", restrictions_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MapRouteFinderResult, result_)
    }

    /**
     * 
     * @param {IIterable<Geopoint>} wayPoints 
     * @param {Integer} optimization 
     * @param {Integer} restrictions_ 
     * @param {Float} headingInDegrees 
     * @returns {IAsyncOperation<MapRouteFinderResult>} 
     */
    GetDrivingRouteFromWaypointsOptimizationRestrictionsAndHeadingAsync(wayPoints, optimization, restrictions_, headingInDegrees) {
        result := ComCall(13, this, "ptr", wayPoints, "int", optimization, "uint", restrictions_, "double", headingInDegrees, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MapRouteFinderResult, result_)
    }

    /**
     * 
     * @param {Geopoint} startPoint 
     * @param {Geopoint} endPoint 
     * @returns {IAsyncOperation<MapRouteFinderResult>} 
     */
    GetWalkingRouteAsync(startPoint, endPoint) {
        result := ComCall(14, this, "ptr", startPoint, "ptr", endPoint, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MapRouteFinderResult, result_)
    }

    /**
     * 
     * @param {IIterable<Geopoint>} wayPoints 
     * @returns {IAsyncOperation<MapRouteFinderResult>} 
     */
    GetWalkingRouteFromWaypointsAsync(wayPoints) {
        result := ComCall(15, this, "ptr", wayPoints, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MapRouteFinderResult, result_)
    }
}
