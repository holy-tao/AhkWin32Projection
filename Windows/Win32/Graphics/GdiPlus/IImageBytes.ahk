#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct IImageBytes extends IUnknown {
    /**
     * The interface identifier for IImageBytes
     * @type {Guid}
     */
    static IID := Guid("{025d1823-6c7d-447b-bbdb-a3cbc3dfa2fc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IImageBytes interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CountBytes  : IntPtr
        LockBytes   : IntPtr
        UnlockBytes : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IImageBytes.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} pcb 
     * @returns {HRESULT} 
     */
    CountBytes(pcb) {
        pcbMarshal := pcb is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pcbMarshal, pcb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cb 
     * @param {Integer} ulOffset 
     * @param {Pointer<Pointer<Void>>} ppvBytes 
     * @returns {HRESULT} 
     */
    LockBytes(cb, ulOffset, ppvBytes) {
        ppvBytesMarshal := ppvBytes is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", cb, "uint", ulOffset, ppvBytesMarshal, ppvBytes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvBytes 
     * @param {Integer} cb 
     * @param {Integer} ulOffset 
     * @returns {HRESULT} 
     */
    UnlockBytes(pvBytes, cb, ulOffset) {
        pvBytesMarshal := pvBytes is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pvBytesMarshal, pvBytes, "uint", cb, "uint", ulOffset, "HRESULT")
        return result
    }

    Query(iid) {
        if (IImageBytes.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CountBytes := CallbackCreate(GetMethod(implObj, "CountBytes"), flags, 2)
        this.vtbl.LockBytes := CallbackCreate(GetMethod(implObj, "LockBytes"), flags, 4)
        this.vtbl.UnlockBytes := CallbackCreate(GetMethod(implObj, "UnlockBytes"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CountBytes)
        CallbackFree(this.vtbl.LockBytes)
        CallbackFree(this.vtbl.UnlockBytes)
    }
}
