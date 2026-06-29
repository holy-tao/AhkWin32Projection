#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\MONIKERPROPERTY.ahk" { MONIKERPROPERTY }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IMonikerProp extends IUnknown {
    /**
     * The interface identifier for IMonikerProp
     * @type {Guid}
     */
    static IID := Guid("{a5ca5f7f-1847-4d87-9c5b-918509f7511d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMonikerProp interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        PutProperty : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMonikerProp.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {MONIKERPROPERTY} mkp 
     * @param {PWSTR} _val 
     * @returns {HRESULT} 
     */
    PutProperty(mkp, _val) {
        _val := _val is String ? StrPtr(_val) : _val

        result := ComCall(3, this, MONIKERPROPERTY, mkp, "ptr", _val, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMonikerProp.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PutProperty := CallbackCreate(GetMethod(implObj, "PutProperty"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PutProperty)
    }
}
