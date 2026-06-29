#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IActionEnumerator.ahk" { IActionEnumerator }
#Import ".\IModelObject.ahk" { IModelObject }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IActionQueryConcept extends IUnknown {
    /**
     * The interface identifier for IActionQueryConcept
     * @type {Guid}
     */
    static IID := Guid("{7fc09c9f-632d-48e8-a97b-2f4f2e5c1161}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActionQueryConcept interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnumerateActions : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActionQueryConcept.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @returns {IActionEnumerator} 
     */
    EnumerateActions(contextObject) {
        result := ComCall(3, this, "ptr", contextObject, "ptr*", &actionEnumerator := 0, "HRESULT")
        return IActionEnumerator(actionEnumerator)
    }

    Query(iid) {
        if (IActionQueryConcept.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumerateActions := CallbackCreate(GetMethod(implObj, "EnumerateActions"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumerateActions)
    }
}
