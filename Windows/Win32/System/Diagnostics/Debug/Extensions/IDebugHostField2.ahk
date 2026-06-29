#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugHostType3.ahk" { IDebugHostType3 }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugHostField.ahk" { IDebugHostField }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostField2 extends IDebugHostField {
    /**
     * The interface identifier for IDebugHostField2
     * @type {Guid}
     */
    static IID := Guid("{99468a0b-ea92-4bd4-9efe-a266160578ca}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostField2 interfaces
    */
    struct Vtbl extends IDebugHostField.Vtbl {
        GetContainingType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostField2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IDebugHostType3} 
     */
    GetContainingType() {
        result := ComCall(14, this, "ptr*", &containingParentType := 0, "HRESULT")
        return IDebugHostType3(containingParentType)
    }

    Query(iid) {
        if (IDebugHostField2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetContainingType := CallbackCreate(GetMethod(implObj, "GetContainingType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetContainingType)
    }
}
