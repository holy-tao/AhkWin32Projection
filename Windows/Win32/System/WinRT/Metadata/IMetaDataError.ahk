#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct IMetaDataError extends IUnknown {
    /**
     * The interface identifier for IMetaDataError
     * @type {Guid}
     */
    static IID := Guid("{b81ff171-20f3-11d2-8dcc-00a0c9b09c19}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMetaDataError interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnError : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMetaDataError.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HRESULT} hrError 
     * @param {Integer} token 
     * @returns {HRESULT} 
     */
    OnError(hrError, token) {
        result := ComCall(3, this, "int", hrError, "uint", token, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMetaDataError.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnError := CallbackCreate(GetMethod(implObj, "OnError"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnError)
    }
}
