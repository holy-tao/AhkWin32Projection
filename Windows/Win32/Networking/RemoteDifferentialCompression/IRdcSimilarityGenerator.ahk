#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SimilarityData.ahk" { SimilarityData }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines methods for enabling the signature generator to generate similarity data and for retrieving the similarity data after it is generated.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/nn-msrdc-irdcsimilaritygenerator
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 */
export default struct IRdcSimilarityGenerator extends IUnknown {
    /**
     * The interface identifier for IRdcSimilarityGenerator
     * @type {Guid}
     */
    static IID := Guid("{96236a80-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for RdcSimilarityGenerator
     * @type {Guid}
     */
    static CLSID := Guid("{96236a92-9dbc-11da-9e3f-0011114ae311}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRdcSimilarityGenerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnableSimilarity : IntPtr
        Results          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRdcSimilarityGenerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enables the signature generator to generate similarity data.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcsimilaritygenerator-enablesimilarity
     */
    EnableSimilarity() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the similarity data that was generated for a file by the signature generator.
     * @returns {SimilarityData} A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similaritydata">SimilarityData</a> structure that will receive the similarity data.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcsimilaritygenerator-results
     */
    Results() {
        _similarityData := SimilarityData()
        result := ComCall(4, this, SimilarityData.Ptr, _similarityData, "HRESULT")
        return _similarityData
    }

    Query(iid) {
        if (IRdcSimilarityGenerator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnableSimilarity := CallbackCreate(GetMethod(implObj, "EnableSimilarity"), flags, 1)
        this.vtbl.Results := CallbackCreate(GetMethod(implObj, "Results"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnableSimilarity)
        CallbackFree(this.vtbl.Results)
    }
}
