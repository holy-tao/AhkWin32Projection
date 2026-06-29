#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEnumUnknown.ahk" { IEnumUnknown }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct ITypeLibRegistrationReader extends IUnknown {
    /**
     * The interface identifier for ITypeLibRegistrationReader
     * @type {Guid}
     */
    static IID := Guid("{ed6a8a2a-b160-4e77-8f73-aa7435cd5c27}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITypeLibRegistrationReader interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnumTypeLibRegistrations : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITypeLibRegistrationReader.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IEnumUnknown} 
     */
    EnumTypeLibRegistrations() {
        result := ComCall(3, this, "ptr*", &ppEnumUnknown := 0, "HRESULT")
        return IEnumUnknown(ppEnumUnknown)
    }

    Query(iid) {
        if (ITypeLibRegistrationReader.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumTypeLibRegistrations := CallbackCreate(GetMethod(implObj, "EnumTypeLibRegistrations"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumTypeLibRegistrations)
    }
}
