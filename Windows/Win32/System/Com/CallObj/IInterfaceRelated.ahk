#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.CallObj
 */
export default struct IInterfaceRelated extends IUnknown {
    /**
     * The interface identifier for IInterfaceRelated
     * @type {Guid}
     */
    static IID := Guid("{d1fb5a79-7706-11d1-adba-00c04fc2adc0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInterfaceRelated interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetIID : IntPtr
        GetIID : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInterfaceRelated.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} iid 
     * @returns {HRESULT} 
     */
    SetIID(iid) {
        result := ComCall(3, this, Guid.Ptr, iid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Guid} 
     */
    GetIID() {
        piid := Guid()
        result := ComCall(4, this, Guid.Ptr, piid, "HRESULT")
        return piid
    }

    Query(iid) {
        if (IInterfaceRelated.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetIID := CallbackCreate(GetMethod(implObj, "SetIID"), flags, 2)
        this.vtbl.GetIID := CallbackCreate(GetMethod(implObj, "GetIID"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetIID)
        CallbackFree(this.vtbl.GetIID)
    }
}
