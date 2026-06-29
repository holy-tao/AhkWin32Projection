#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a method for retrieving a key/value pair of strings from an IEntity, IRelationship or ISchemaProvider object.
 * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nn-structuredquery-imetadata
 * @namespace Windows.Win32.System.Search
 */
export default struct IMetaData extends IUnknown {
    /**
     * The interface identifier for IMetaData
     * @type {Guid}
     */
    static IID := Guid("{780102b0-c43b-4876-bc7b-5e9ba5c88794}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMetaData interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMetaData.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves one key/value pair from the metadata of an IEntity, IRelationship, or ISchemaProvider object.
     * @param {Pointer<PWSTR>} ppszKey Type: <b>LPCWSTR*</b>
     * 
     * Receives the key of the metadata pair as a Unicode string. The calling application must free the returned string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @param {Pointer<PWSTR>} ppszValue Type: <b>LPWSTR*</b>
     * 
     * Receives the value of the metadata pair as a Unicode string. The calling application must free the returned string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-imetadata-getdata
     */
    GetData(ppszKey, ppszValue) {
        ppszKeyMarshal := ppszKey is VarRef ? "ptr*" : "ptr"
        ppszValueMarshal := ppszValue is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, ppszKeyMarshal, ppszKey, ppszValueMarshal, ppszValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMetaData.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetData := CallbackCreate(GetMethod(implObj, "GetData"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetData)
    }
}
