#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Supplies data to an analysis effect.
 * @remarks
 * This interface can be implemented by either an <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1drawtransform">ID2D1DrawTransform</a> or an <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1computetransform">ID2D1ComputeTransform</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1analysistransform
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1AnalysisTransform extends IUnknown {
    /**
     * The interface identifier for ID2D1AnalysisTransform
     * @type {Guid}
     */
    static IID := Guid("{0359dc30-95e6-4568-9055-27720d130e93}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1AnalysisTransform interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ProcessAnalysisResults : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1AnalysisTransform.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Supplies the analysis data to an analysis transform.
     * @remarks
     * The output of the transform will be copied to CPU-accessible memory by the imaging effects system before being passed to the implementation.
     * 
     *  If this call fails, the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1effect">ID2D1Effect</a> instance is placed into an error state and fails to draw.
     * @param {Pointer<Integer>} analysisData Type: <b>const BYTE*</b>
     * 
     * The data that the transform will analyze.
     * @param {Integer} analysisDataCount Type: <b>UINT</b>
     * 
     * The size of the analysis data.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1analysistransform-processanalysisresults
     */
    ProcessAnalysisResults(analysisData, analysisDataCount) {
        analysisDataMarshal := analysisData is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, analysisDataMarshal, analysisData, "uint", analysisDataCount, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID2D1AnalysisTransform.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ProcessAnalysisResults := CallbackCreate(GetMethod(implObj, "ProcessAnalysisResults"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ProcessAnalysisResults)
    }
}
