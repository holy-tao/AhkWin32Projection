#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\MapLocationFinderResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class IMapLocationFinderStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapLocationFinderStatics2
     * @type {Guid}
     */
    static IID => Guid("{959a8b96-6485-4dfd-851a-33ac317e3af6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindLocationsAtWithAccuracyAsync"]

    /**
     * 
     * @param {Geopoint} queryPoint 
     * @param {Integer} accuracy 
     * @returns {IAsyncOperation<MapLocationFinderResult>} 
     */
    FindLocationsAtWithAccuracyAsync(queryPoint, accuracy) {
        result := ComCall(6, this, "ptr", queryPoint, "int", accuracy, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MapLocationFinderResult, result_)
    }
}
