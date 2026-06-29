#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SimilarityFileId.ahk" { SimilarityFileId }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods for retrieving information from the file list returned by the ISimilarity::FindSimilarFileId method.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/nn-msrdc-ifindsimilarresults
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 */
export default struct IFindSimilarResults extends IUnknown {
    /**
     * The interface identifier for IFindSimilarResults
     * @type {Guid}
     */
    static IID := Guid("{96236a81-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for FindSimilarResults
     * @type {Guid}
     */
    static CLSID := Guid("{96236a93-9dbc-11da-9e3f-0011114ae311}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFindSimilarResults interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSize       : IntPtr
        GetNextFileId : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFindSimilarResults.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the number of entries in the file list that was returned by the ISimilarity::FindSimilarFileId method.
     * @returns {Integer} A pointer to a variable that receives the number of entries in the file list.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-ifindsimilarresults-getsize
     */
    GetSize() {
        result := ComCall(3, this, "uint*", &_size := 0, "HRESULT")
        return _size
    }

    /**
     * Retrieves the next valid similarity file ID in the file list that was returned by the ISimilarity::FindSimilarFileId method.
     * @param {Pointer<Integer>} numTraitsMatched A pointer to a variable that receives the number of traits that were matched.
     * @param {Pointer<SimilarityFileId>} _similarityFileId A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similarityfileid">SimilarityFileId</a> structure that contains the similarity file ID of the matching file.
     * @returns {HRESULT} Returns <b>S_OK</b> on success, or an error <b>HRESULT</b> on failure.
     * 
     * This method can also return the following error code.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-ifindsimilarresults-getnextfileid
     */
    GetNextFileId(numTraitsMatched, _similarityFileId) {
        numTraitsMatchedMarshal := numTraitsMatched is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, numTraitsMatchedMarshal, numTraitsMatched, SimilarityFileId.Ptr, _similarityFileId, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFindSimilarResults.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSize := CallbackCreate(GetMethod(implObj, "GetSize"), flags, 2)
        this.vtbl.GetNextFileId := CallbackCreate(GetMethod(implObj, "GetNextFileId"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSize)
        CallbackFree(this.vtbl.GetNextFileId)
    }
}
