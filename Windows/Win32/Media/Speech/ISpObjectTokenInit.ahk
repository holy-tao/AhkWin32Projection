#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISpObjectToken.ahk" { ISpObjectToken }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpDataKey.ahk" { ISpDataKey }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpObjectTokenInit extends ISpObjectToken {
    /**
     * The interface identifier for ISpObjectTokenInit
     * @type {Guid}
     */
    static IID := Guid("{b8aab0cf-346f-49d8-9499-c8b03f161d51}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpObjectTokenInit interfaces
    */
    struct Vtbl extends ISpObjectToken.Vtbl {
        InitFromDataKey : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpObjectTokenInit.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszCategoryId 
     * @param {PWSTR} pszTokenId 
     * @param {ISpDataKey} pDataKey 
     * @returns {HRESULT} 
     */
    InitFromDataKey(pszCategoryId, pszTokenId, pDataKey) {
        pszCategoryId := pszCategoryId is String ? StrPtr(pszCategoryId) : pszCategoryId
        pszTokenId := pszTokenId is String ? StrPtr(pszTokenId) : pszTokenId

        result := ComCall(25, this, "ptr", pszCategoryId, "ptr", pszTokenId, "ptr", pDataKey, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpObjectTokenInit.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitFromDataKey := CallbackCreate(GetMethod(implObj, "InitFromDataKey"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitFromDataKey)
    }
}
