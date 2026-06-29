#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\AddressSpaceRelation.ahk" { AddressSpaceRelation }
#Import ".\IDebugHostContext.ahk" { IDebugHostContext }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostContext2 extends IDebugHostContext {
    /**
     * The interface identifier for IDebugHostContext2
     * @type {Guid}
     */
    static IID := Guid("{e92274a2-47f4-4538-a196-b83db25fe403}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostContext2 interfaces
    */
    struct Vtbl extends IDebugHostContext.Vtbl {
        GetAddressSpaceRelation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostContext2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDebugHostContext2} pContext 
     * @returns {AddressSpaceRelation} 
     */
    GetAddressSpaceRelation(pContext) {
        result := ComCall(4, this, "ptr", pContext, "int*", &pAddressSpaceRelation := 0, "HRESULT")
        return pAddressSpaceRelation
    }

    Query(iid) {
        if (IDebugHostContext2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAddressSpaceRelation := CallbackCreate(GetMethod(implObj, "GetAddressSpaceRelation"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAddressSpaceRelation)
    }
}
