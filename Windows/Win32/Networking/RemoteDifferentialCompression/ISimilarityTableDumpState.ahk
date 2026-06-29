#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SimilarityDumpData.ahk" { SimilarityDumpData }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a method for retrieving information from the similarity traits list that was returned by the ISimilarityTraitsTable::BeginDump method.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/nn-msrdc-isimilaritytabledumpstate
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 */
export default struct ISimilarityTableDumpState extends IUnknown {
    /**
     * The interface identifier for ISimilarityTableDumpState
     * @type {Guid}
     */
    static IID := Guid("{96236a7b-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for SimilarityTableDumpState
     * @type {Guid}
     */
    static CLSID := Guid("{96236a8e-9dbc-11da-9e3f-0011114ae311}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISimilarityTableDumpState interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetNextData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISimilarityTableDumpState.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves one or more SimilarityDumpData structures from the similarity traits list that was returned by the ISimilarityTraitsTable::BeginDump method.
     * @param {Integer} resultsSize The number of <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similaritydumpdata">SimilarityDumpData</a> structures that can be stored in the buffer that the <i>results</i> parameter points to.
     * @param {Pointer<Integer>} resultsUsed A pointer to a variable that receives the number of <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similaritydumpdata">SimilarityDumpData</a> structures that were returned in the buffer that the <i>results</i> parameter points to.
     * @param {Pointer<BOOL>} eof A pointer to a variable that receives <b>TRUE</b> if the end of the file is reached; otherwise, <b>FALSE</b>.
     * @param {Pointer<SimilarityDumpData>} results A pointer to a buffer that receives the <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similaritydumpdata">SimilarityDumpData</a> structures.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytabledumpstate-getnextdata
     */
    GetNextData(resultsSize, resultsUsed, eof, results) {
        resultsUsedMarshal := resultsUsed is VarRef ? "uint*" : "ptr"
        eofMarshal := eof is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "uint", resultsSize, resultsUsedMarshal, resultsUsed, eofMarshal, eof, SimilarityDumpData.Ptr, results, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISimilarityTableDumpState.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNextData := CallbackCreate(GetMethod(implObj, "GetNextData"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNextData)
    }
}
