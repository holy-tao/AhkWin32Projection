#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ITrackingProtection extends IUnknown {
    /**
     * The interface identifier for ITrackingProtection
     * @type {Guid}
     */
    static IID := Guid("{30510803-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITrackingProtection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EvaluateUrl : IntPtr
        GetEnabled  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITrackingProtection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @returns {BOOL} 
     */
    EvaluateUrl(bstrUrl) {
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        result := ComCall(3, this, BSTR, bstrUrl, BOOL.Ptr, &pfAllowed := 0, "HRESULT")
        return pfAllowed
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetEnabled() {
        result := ComCall(4, this, BOOL.Ptr, &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    Query(iid) {
        if (ITrackingProtection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EvaluateUrl := CallbackCreate(GetMethod(implObj, "EvaluateUrl"), flags, 3)
        this.vtbl.GetEnabled := CallbackCreate(GetMethod(implObj, "GetEnabled"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EvaluateUrl)
        CallbackFree(this.vtbl.GetEnabled)
    }
}
