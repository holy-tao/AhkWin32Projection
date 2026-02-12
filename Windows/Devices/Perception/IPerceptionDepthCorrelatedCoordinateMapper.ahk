#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\POINT.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class IPerceptionDepthCorrelatedCoordinateMapper extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerceptionDepthCorrelatedCoordinateMapper
     * @type {Guid}
     */
    static IID => Guid("{5b4d9d1d-b5f6-469c-b8c2-b97a45e6863b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MapPixelToTarget", "MapPixelsToTarget", "MapRegionOfPixelsToTargetAsync", "MapAllPixelsToTargetAsync"]

    /**
     * 
     * @param {POINT} sourcePixelCoordinate 
     * @param {PerceptionDepthFrame} depthFrame 
     * @returns {POINT} 
     */
    MapPixelToTarget(sourcePixelCoordinate, depthFrame) {
        result_ := POINT()
        result := ComCall(6, this, "ptr", sourcePixelCoordinate, "ptr", depthFrame, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} sourceCoordinates_length 
     * @param {Pointer<POINT>} sourceCoordinates 
     * @param {PerceptionDepthFrame} depthFrame 
     * @param {Pointer<Integer>} results_length 
     * @param {Pointer<Pointer<POINT>>} results 
     * @returns {HRESULT} 
     */
    MapPixelsToTarget(sourceCoordinates_length, sourceCoordinates, depthFrame, results_length, results) {
        results_lengthMarshal := results_length is VarRef ? "uint*" : "ptr"
        resultsMarshal := results is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "uint", sourceCoordinates_length, "ptr", sourceCoordinates, "ptr", depthFrame, results_lengthMarshal, results_length, resultsMarshal, results, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RECT} region_ 
     * @param {PerceptionDepthFrame} depthFrame 
     * @param {Pointer<Integer>} targetCoordinates_length 
     * @param {Pointer<Pointer<POINT>>} targetCoordinates 
     * @returns {IAsyncAction} 
     */
    MapRegionOfPixelsToTargetAsync(region_, depthFrame, targetCoordinates_length, targetCoordinates) {
        targetCoordinates_lengthMarshal := targetCoordinates_length is VarRef ? "uint*" : "ptr"
        targetCoordinatesMarshal := targetCoordinates is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "ptr", region_, "ptr", depthFrame, targetCoordinates_lengthMarshal, targetCoordinates_length, targetCoordinatesMarshal, targetCoordinates, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {PerceptionDepthFrame} depthFrame 
     * @param {Pointer<Integer>} targetCoordinates_length 
     * @param {Pointer<Pointer<POINT>>} targetCoordinates 
     * @returns {IAsyncAction} 
     */
    MapAllPixelsToTargetAsync(depthFrame, targetCoordinates_length, targetCoordinates) {
        targetCoordinates_lengthMarshal := targetCoordinates_length is VarRef ? "uint*" : "ptr"
        targetCoordinatesMarshal := targetCoordinates is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", depthFrame, targetCoordinates_lengthMarshal, targetCoordinates_length, targetCoordinatesMarshal, targetCoordinates, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }
}
