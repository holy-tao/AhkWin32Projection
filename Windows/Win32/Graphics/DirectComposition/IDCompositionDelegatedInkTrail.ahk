#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionDelegatedInkTrail extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionDelegatedInkTrail
     * @type {Guid}
     */
    static IID => Guid("{c2448e9b-547d-4057-8cf5-8144ede1c2da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddTrailPoints", "AddTrailPointsWithPrediction", "RemoveTrailPoints", "StartNewTrail"]

    /**
     * 
     * @param {Pointer<DCompositionInkTrailPoint>} inkPoints 
     * @param {Integer} inkPointsCount 
     * @param {Pointer<Integer>} generationId 
     * @returns {HRESULT} 
     */
    AddTrailPoints(inkPoints, inkPointsCount, generationId) {
        result := ComCall(3, this, "ptr", inkPoints, "uint", inkPointsCount, "uint*", generationId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DCompositionInkTrailPoint>} inkPoints 
     * @param {Integer} inkPointsCount 
     * @param {Pointer<DCompositionInkTrailPoint>} predictedInkPoints 
     * @param {Integer} predictedInkPointsCount 
     * @param {Pointer<Integer>} generationId 
     * @returns {HRESULT} 
     */
    AddTrailPointsWithPrediction(inkPoints, inkPointsCount, predictedInkPoints, predictedInkPointsCount, generationId) {
        result := ComCall(4, this, "ptr", inkPoints, "uint", inkPointsCount, "ptr", predictedInkPoints, "uint", predictedInkPointsCount, "uint*", generationId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} generationId 
     * @returns {HRESULT} 
     */
    RemoveTrailPoints(generationId) {
        result := ComCall(5, this, "uint", generationId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_COLOR_F>} color 
     * @returns {HRESULT} 
     */
    StartNewTrail(color) {
        result := ComCall(6, this, "ptr", color, "HRESULT")
        return result
    }
}
