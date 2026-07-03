#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostFunctionLocalStorage2 extends IUnknown {
    /**
     * The interface identifier for IDebugHostFunctionLocalStorage2
     * @type {Guid}
     */
    static IID := Guid("{213b3725-36a2-45a0-9ea4-854d46d85195}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostFunctionLocalStorage2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetExtendedRegisterAddressInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostFunctionLocalStorage2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} registerId 
     * @param {Pointer<Integer>} offset 
     * @param {Pointer<Boolean>} isIndirectAccess 
     * @param {Pointer<Integer>} indirectOffset 
     * @returns {HRESULT} 
     */
    GetExtendedRegisterAddressInfo(registerId, offset, isIndirectAccess, indirectOffset) {
        registerIdMarshal := registerId is VarRef ? "uint*" : "ptr"
        offsetMarshal := offset is VarRef ? "int64*" : "ptr"
        isIndirectAccessMarshal := isIndirectAccess is VarRef ? "int*" : "ptr"
        indirectOffsetMarshal := indirectOffset is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, registerIdMarshal, registerId, offsetMarshal, offset, isIndirectAccessMarshal, isIndirectAccess, indirectOffsetMarshal, indirectOffset, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugHostFunctionLocalStorage2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetExtendedRegisterAddressInfo := CallbackCreate(GetMethod(implObj, "GetExtendedRegisterAddressInfo"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetExtendedRegisterAddressInfo)
    }
}
