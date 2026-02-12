#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IDelegatedInkTrailVisual extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDelegatedInkTrailVisual
     * @type {Guid}
     */
    static IID => Guid("{856e60b1-e1ab-5b23-8e3d-d513f221c998}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddTrailPoints", "AddTrailPointsWithPrediction", "RemoveTrailPoints", "StartNewTrail"]

    /**
     * 
     * @param {Integer} inkPoints_length 
     * @param {Pointer<InkTrailPoint>} inkPoints 
     * @returns {Integer} 
     */
    AddTrailPoints(inkPoints_length, inkPoints) {
        result := ComCall(6, this, "uint", inkPoints_length, "ptr", inkPoints, "uint*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} inkPoints_length 
     * @param {Pointer<InkTrailPoint>} inkPoints 
     * @param {Integer} predictedInkPoints_length 
     * @param {Pointer<InkTrailPoint>} predictedInkPoints 
     * @returns {Integer} 
     */
    AddTrailPointsWithPrediction(inkPoints_length, inkPoints, predictedInkPoints_length, predictedInkPoints) {
        result := ComCall(7, this, "uint", inkPoints_length, "ptr", inkPoints, "uint", predictedInkPoints_length, "ptr", predictedInkPoints, "uint*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} generationId 
     * @returns {HRESULT} 
     */
    RemoveTrailPoints(generationId) {
        result := ComCall(8, this, "uint", generationId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Color} color_ 
     * @returns {HRESULT} 
     */
    StartNewTrail(color_) {
        result := ComCall(9, this, "ptr", color_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
