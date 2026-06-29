#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IKeyStore.ahk" { IKeyStore }
#Import ".\IModelObject.ahk" { IModelObject }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IStringDisplayableConcept extends IUnknown {
    /**
     * The interface identifier for IStringDisplayableConcept
     * @type {Guid}
     */
    static IID := Guid("{d28e8d70-6c00-4205-940d-501016601ea3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStringDisplayableConcept interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ToDisplayString : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStringDisplayableConcept.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {IKeyStore} metadata 
     * @returns {BSTR} 
     */
    ToDisplayString(contextObject, metadata) {
        displayString := BSTR.Owned()
        result := ComCall(3, this, "ptr", contextObject, "ptr", metadata, BSTR.Ptr, displayString, "HRESULT")
        return displayString
    }

    Query(iid) {
        if (IStringDisplayableConcept.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ToDisplayString := CallbackCreate(GetMethod(implObj, "ToDisplayString"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ToDisplayString)
    }
}
