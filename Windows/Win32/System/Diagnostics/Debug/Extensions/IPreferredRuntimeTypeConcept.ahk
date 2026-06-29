#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IModelObject.ahk" { IModelObject }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IPreferredRuntimeTypeConcept extends IUnknown {
    /**
     * The interface identifier for IPreferredRuntimeTypeConcept
     * @type {Guid}
     */
    static IID := Guid("{9d6c1d7b-a76f-4618-8068-5f76bd9a4e8a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPreferredRuntimeTypeConcept interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CastToPreferredRuntimeType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPreferredRuntimeTypeConcept.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @returns {IModelObject} 
     */
    CastToPreferredRuntimeType(contextObject) {
        result := ComCall(3, this, "ptr", contextObject, "ptr*", &_object := 0, "HRESULT")
        return IModelObject(_object)
    }

    Query(iid) {
        if (IPreferredRuntimeTypeConcept.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CastToPreferredRuntimeType := CallbackCreate(GetMethod(implObj, "CastToPreferredRuntimeType"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CastToPreferredRuntimeType)
    }
}
