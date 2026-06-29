#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IModelObject.ahk" { IModelObject }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WrappedObjectPreference.ahk" { WrappedObjectPreference }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IObjectWrapperConcept extends IUnknown {
    /**
     * The interface identifier for IObjectWrapperConcept
     * @type {Guid}
     */
    static IID := Guid("{a4952c59-7144-4c76-873b-6046c0955ffc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IObjectWrapperConcept interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetWrappedObject : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IObjectWrapperConcept.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IModelObject} pContextObject 
     * @param {Pointer<IModelObject>} wrappedObject 
     * @param {Pointer<WrappedObjectPreference>} pUsagePreference 
     * @returns {HRESULT} 
     */
    GetWrappedObject(pContextObject, wrappedObject, pUsagePreference) {
        pUsagePreferenceMarshal := pUsagePreference is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pContextObject, IModelObject.Ptr, wrappedObject, pUsagePreferenceMarshal, pUsagePreference, "HRESULT")
        return result
    }

    Query(iid) {
        if (IObjectWrapperConcept.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetWrappedObject := CallbackCreate(GetMethod(implObj, "GetWrappedObject"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetWrappedObject)
    }
}
