#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Direct2D\Common\D2D1_COLOR_F.ahk" { D2D1_COLOR_F }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DCompositionInkTrailPoint.ahk" { DCompositionInkTrailPoint }

/**
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionDelegatedInkTrail extends IUnknown {
    /**
     * The interface identifier for IDCompositionDelegatedInkTrail
     * @type {Guid}
     */
    static IID := Guid("{c2448e9b-547d-4057-8cf5-8144ede1c2da}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionDelegatedInkTrail interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddTrailPoints               : IntPtr
        AddTrailPointsWithPrediction : IntPtr
        RemoveTrailPoints            : IntPtr
        StartNewTrail                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionDelegatedInkTrail.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<DCompositionInkTrailPoint>} inkPoints 
     * @param {Integer} inkPointsCount 
     * @returns {Integer} 
     */
    AddTrailPoints(inkPoints, inkPointsCount) {
        result := ComCall(3, this, DCompositionInkTrailPoint.Ptr, inkPoints, "uint", inkPointsCount, "uint*", &generationId := 0, "HRESULT")
        return generationId
    }

    /**
     * 
     * @param {Pointer<DCompositionInkTrailPoint>} inkPoints 
     * @param {Integer} inkPointsCount 
     * @param {Pointer<DCompositionInkTrailPoint>} predictedInkPoints 
     * @param {Integer} predictedInkPointsCount 
     * @returns {Integer} 
     */
    AddTrailPointsWithPrediction(inkPoints, inkPointsCount, predictedInkPoints, predictedInkPointsCount) {
        result := ComCall(4, this, DCompositionInkTrailPoint.Ptr, inkPoints, "uint", inkPointsCount, DCompositionInkTrailPoint.Ptr, predictedInkPoints, "uint", predictedInkPointsCount, "uint*", &generationId := 0, "HRESULT")
        return generationId
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
     * @param {Pointer<D2D1_COLOR_F>} _color 
     * @returns {HRESULT} 
     */
    StartNewTrail(_color) {
        result := ComCall(6, this, D2D1_COLOR_F.Ptr, _color, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDCompositionDelegatedInkTrail.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddTrailPoints := CallbackCreate(GetMethod(implObj, "AddTrailPoints"), flags, 4)
        this.vtbl.AddTrailPointsWithPrediction := CallbackCreate(GetMethod(implObj, "AddTrailPointsWithPrediction"), flags, 6)
        this.vtbl.RemoveTrailPoints := CallbackCreate(GetMethod(implObj, "RemoveTrailPoints"), flags, 2)
        this.vtbl.StartNewTrail := CallbackCreate(GetMethod(implObj, "StartNewTrail"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddTrailPoints)
        CallbackFree(this.vtbl.AddTrailPointsWithPrediction)
        CallbackFree(this.vtbl.RemoveTrailPoints)
        CallbackFree(this.vtbl.StartNewTrail)
    }
}
