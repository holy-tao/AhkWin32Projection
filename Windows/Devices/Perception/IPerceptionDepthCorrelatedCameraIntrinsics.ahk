#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Numerics\Vector3.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class IPerceptionDepthCorrelatedCameraIntrinsics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerceptionDepthCorrelatedCameraIntrinsics
     * @type {Guid}
     */
    static IID => Guid("{6548ca01-86de-5be1-6582-807fcf4c95cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UnprojectPixelAtCorrelatedDepth", "UnprojectPixelsAtCorrelatedDepth", "UnprojectRegionPixelsAtCorrelatedDepthAsync", "UnprojectAllPixelsAtCorrelatedDepthAsync"]

    /**
     * 
     * @param {POINT} pixelCoordinate 
     * @param {PerceptionDepthFrame} depthFrame 
     * @returns {Vector3} 
     */
    UnprojectPixelAtCorrelatedDepth(pixelCoordinate, depthFrame) {
        result_ := Vector3()
        result := ComCall(6, this, "ptr", pixelCoordinate, "ptr", depthFrame, "ptr", result_, "int")
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
     * @param {Pointer<Pointer<Vector3>>} results 
     * @returns {HRESULT} 
     */
    UnprojectPixelsAtCorrelatedDepth(sourceCoordinates_length, sourceCoordinates, depthFrame, results_length, results) {
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
     * @param {Pointer<Integer>} results_length 
     * @param {Pointer<Pointer<Vector3>>} results 
     * @returns {IAsyncAction} 
     */
    UnprojectRegionPixelsAtCorrelatedDepthAsync(region_, depthFrame, results_length, results) {
        results_lengthMarshal := results_length is VarRef ? "uint*" : "ptr"
        resultsMarshal := results is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "ptr", region_, "ptr", depthFrame, results_lengthMarshal, results_length, resultsMarshal, results, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {PerceptionDepthFrame} depthFrame 
     * @param {Pointer<Integer>} results_length 
     * @param {Pointer<Pointer<Vector3>>} results 
     * @returns {IAsyncAction} 
     */
    UnprojectAllPixelsAtCorrelatedDepthAsync(depthFrame, results_length, results) {
        results_lengthMarshal := results_length is VarRef ? "uint*" : "ptr"
        resultsMarshal := results is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", depthFrame, results_lengthMarshal, results_length, resultsMarshal, results, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }
}
