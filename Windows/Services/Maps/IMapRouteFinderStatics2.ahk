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
class IMapRouteFinderStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapRouteFinderStatics2
     * @type {Guid}
     */
    static IID => Guid("{afcc2c73-7760-49af-b3bd-baf135b703e1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDrivingRouteWithOptionsAsync"]

    /**
     * 
     * @param {Geopoint} startPoint 
     * @param {Geopoint} endPoint 
     * @param {MapRouteDrivingOptions} options 
     * @returns {IAsyncOperation<MapRouteFinderResult>} 
     */
    GetDrivingRouteWithOptionsAsync(startPoint, endPoint, options) {
        result := ComCall(6, this, "ptr", startPoint, "ptr", endPoint, "ptr", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MapRouteFinderResult, result_)
    }
}
