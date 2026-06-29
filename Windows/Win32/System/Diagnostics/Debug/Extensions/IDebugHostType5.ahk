#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugHostType4.ahk" { IDebugHostType4 }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugHostType.ahk" { IDebugHostType }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostType5 extends IDebugHostType4 {
    /**
     * The interface identifier for IDebugHostType5
     * @type {Guid}
     */
    static IID := Guid("{db6716ce-8ee8-4c86-89db-a658915c87f4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostType5 interfaces
    */
    struct Vtbl extends IDebugHostType4.Vtbl {
        IsBaseTypeOf : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostType5.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDebugHostType} pOtherType 
     * @returns {Boolean} 
     */
    IsBaseTypeOf(pOtherType) {
        result := ComCall(38, this, "ptr", pOtherType, "int*", &pIsBase := 0, "HRESULT")
        return pIsBase
    }

    Query(iid) {
        if (IDebugHostType5.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsBaseTypeOf := CallbackCreate(GetMethod(implObj, "IsBaseTypeOf"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsBaseTypeOf)
    }
}
