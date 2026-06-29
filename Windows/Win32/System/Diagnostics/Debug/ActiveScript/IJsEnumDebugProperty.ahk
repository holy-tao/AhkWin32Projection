#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IJsDebugProperty.ahk" { IJsDebugProperty }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IJsEnumDebugProperty extends IUnknown {
    /**
     * The interface identifier for IJsEnumDebugProperty
     * @type {Guid}
     */
    static IID := Guid("{4092432f-2f0f-4fe1-b638-5b74a52cdcbe}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IJsEnumDebugProperty interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next     : IntPtr
        GetCount : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IJsEnumDebugProperty.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} count 
     * @param {Pointer<IJsDebugProperty>} ppDebugProperty 
     * @param {Pointer<Integer>} pActualCount 
     * @returns {HRESULT} 
     */
    Next(count, ppDebugProperty, pActualCount) {
        pActualCountMarshal := pActualCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", count, IJsDebugProperty.Ptr, ppDebugProperty, pActualCountMarshal, pActualCount, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCount() {
        result := ComCall(4, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    Query(iid) {
        if (IJsEnumDebugProperty.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.GetCount)
    }
}
