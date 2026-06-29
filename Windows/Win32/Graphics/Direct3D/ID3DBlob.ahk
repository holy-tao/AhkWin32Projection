#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 */
export default struct ID3DBlob extends IUnknown {
    /**
     * The interface identifier for ID3DBlob
     * @type {Guid}
     */
    static IID := Guid("{8ba5fb08-5195-40e2-ac58-0d989c3a0102}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3DBlob interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetBufferPointer : IntPtr
        GetBufferSize    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3DBlob.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Pointer<Void>} 
     */
    GetBufferPointer() {
        result := ComCall(3, this, IntPtr)
        return result
    }

    /**
     * 
     * @returns {Pointer} 
     */
    GetBufferSize() {
        result := ComCall(4, this, IntPtr)
        return result
    }

    Query(iid) {
        if (ID3DBlob.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetBufferPointer := CallbackCreate(GetMethod(implObj, "GetBufferPointer"), flags, 1)
        this.vtbl.GetBufferSize := CallbackCreate(GetMethod(implObj, "GetBufferSize"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetBufferPointer)
        CallbackFree(this.vtbl.GetBufferSize)
    }
}
