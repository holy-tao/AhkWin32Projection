#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Gets the tokens that result from using a word breaker.
 * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nn-structuredquery-itokencollection
 * @namespace Windows.Win32.System.Search
 */
export default struct ITokenCollection extends IUnknown {
    /**
     * The interface identifier for ITokenCollection
     * @type {Guid}
     */
    static IID := Guid("{22d8b4f2-f577-4adb-a335-c2ae88416fab}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITokenCollection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        NumberOfTokens : IntPtr
        GetToken       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITokenCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the number of tokens in the collection.
     * @param {Pointer<Integer>} pCount Type: <b>ULONG*</b>
     * 
     * Receives the number of tokens within the collection.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-itokencollection-numberoftokens
     */
    NumberOfTokens(pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * Retrieves the position, length, and any overriding string of an individual token.
     * @param {Integer} i Type: <b>ULONG</b>
     * 
     * The zero-based index of the desired token within the collection.
     * @param {Pointer<Integer>} pBegin Type: <b>ULONG*</b>
     * 
     * Receives the zero-based starting position of the specified token, in characters. This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} pLength Type: <b>ULONG*</b>
     * 
     * Receives the number of characters spanned by the token. This parameter can be <b>NULL</b>.
     * @param {Pointer<PWSTR>} ppsz Type: <b>LPWSTR*</b>
     * 
     * Receives the overriding text for this token if available, or <b>NULL</b> if there is none.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-itokencollection-gettoken
     */
    GetToken(i, pBegin, pLength, ppsz) {
        pBeginMarshal := pBegin is VarRef ? "uint*" : "ptr"
        pLengthMarshal := pLength is VarRef ? "uint*" : "ptr"
        ppszMarshal := ppsz is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", i, pBeginMarshal, pBegin, pLengthMarshal, pLength, ppszMarshal, ppsz, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITokenCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.NumberOfTokens := CallbackCreate(GetMethod(implObj, "NumberOfTokens"), flags, 2)
        this.vtbl.GetToken := CallbackCreate(GetMethod(implObj, "GetToken"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.NumberOfTokens)
        CallbackFree(this.vtbl.GetToken)
    }
}
