#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugHostBaseClass.ahk" { IDebugHostBaseClass }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostBaseClass2 extends IDebugHostBaseClass {
    /**
     * The interface identifier for IDebugHostBaseClass2
     * @type {Guid}
     */
    static IID := Guid("{435460e2-fd3b-4275-b36c-88ef50188588}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostBaseClass2 interfaces
    */
    struct Vtbl extends IDebugHostBaseClass.Vtbl {
        IsVirtual                    : IntPtr
        GetVirtualBaseOffsetLocation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostBaseClass2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsVirtual() {
        result := ComCall(11, this, "int*", &pIsVirtual := 0, "HRESULT")
        return pIsVirtual
    }

    /**
     * 
     * @param {Pointer<Integer>} pTableOffset 
     * @param {Pointer<Integer>} pSlotOffset 
     * @param {Pointer<Integer>} pSlotSize 
     * @param {Pointer<Boolean>} pSlotIsSigned 
     * @returns {HRESULT} 
     */
    GetVirtualBaseOffsetLocation(pTableOffset, pSlotOffset, pSlotSize, pSlotIsSigned) {
        pTableOffsetMarshal := pTableOffset is VarRef ? "int64*" : "ptr"
        pSlotOffsetMarshal := pSlotOffset is VarRef ? "int64*" : "ptr"
        pSlotSizeMarshal := pSlotSize is VarRef ? "uint*" : "ptr"
        pSlotIsSignedMarshal := pSlotIsSigned is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pTableOffsetMarshal, pTableOffset, pSlotOffsetMarshal, pSlotOffset, pSlotSizeMarshal, pSlotSize, pSlotIsSignedMarshal, pSlotIsSigned, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugHostBaseClass2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsVirtual := CallbackCreate(GetMethod(implObj, "IsVirtual"), flags, 2)
        this.vtbl.GetVirtualBaseOffsetLocation := CallbackCreate(GetMethod(implObj, "GetVirtualBaseOffsetLocation"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsVirtual)
        CallbackFree(this.vtbl.GetVirtualBaseOffsetLocation)
    }
}
