#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IModelObject.ahk" { IModelObject }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IEquatableConcept extends IUnknown {
    /**
     * The interface identifier for IEquatableConcept
     * @type {Guid}
     */
    static IID := Guid("{c52d5d3d-609d-4d5d-8a82-46b0acdec4f4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEquatableConcept interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AreObjectsEqual : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEquatableConcept.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {IModelObject} otherObject 
     * @returns {Boolean} 
     */
    AreObjectsEqual(contextObject, otherObject) {
        result := ComCall(3, this, "ptr", contextObject, "ptr", otherObject, "int*", &isEqual := 0, "HRESULT")
        return isEqual
    }

    Query(iid) {
        if (IEquatableConcept.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AreObjectsEqual := CallbackCreate(GetMethod(implObj, "AreObjectsEqual"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AreObjectsEqual)
    }
}
