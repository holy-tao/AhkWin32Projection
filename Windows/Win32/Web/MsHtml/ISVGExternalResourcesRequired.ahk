#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISVGAnimatedBoolean.ahk" { ISVGAnimatedBoolean }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGExternalResourcesRequired extends IDispatch {
    /**
     * The interface identifier for ISVGExternalResourcesRequired
     * @type {Guid}
     */
    static IID := Guid("{305104df-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGExternalResourcesRequired interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_externalResourcesRequired : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGExternalResourcesRequired.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISVGAnimatedBoolean} 
     */
    externalResourcesRequired {
        get => this.get_externalResourcesRequired()
    }

    /**
     * 
     * @returns {ISVGAnimatedBoolean} 
     */
    get_externalResourcesRequired() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedBoolean(p)
    }

    Query(iid) {
        if (ISVGExternalResourcesRequired.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_externalResourcesRequired := CallbackCreate(GetMethod(implObj, "get_externalResourcesRequired"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_externalResourcesRequired)
    }
}
