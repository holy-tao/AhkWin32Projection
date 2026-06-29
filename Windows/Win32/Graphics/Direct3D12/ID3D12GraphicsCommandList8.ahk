#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12GraphicsCommandList7.ahk" { ID3D12GraphicsCommandList7 }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12GraphicsCommandList8 extends ID3D12GraphicsCommandList7 {
    /**
     * The interface identifier for ID3D12GraphicsCommandList8
     * @type {Guid}
     */
    static IID := Guid("{ee936ef9-599d-4d28-938e-23c4ad05ce51}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12GraphicsCommandList8 interfaces
    */
    struct Vtbl extends ID3D12GraphicsCommandList7.Vtbl {
        OMSetFrontAndBackStencilRef : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12GraphicsCommandList8.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} FrontStencilRef 
     * @param {Integer} BackStencilRef 
     * @returns {String} Nothing - always returns an empty string
     */
    OMSetFrontAndBackStencilRef(FrontStencilRef, BackStencilRef) {
        ComCall(81, this, "uint", FrontStencilRef, "uint", BackStencilRef)
    }

    Query(iid) {
        if (ID3D12GraphicsCommandList8.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OMSetFrontAndBackStencilRef := CallbackCreate(GetMethod(implObj, "OMSetFrontAndBackStencilRef"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OMSetFrontAndBackStencilRef)
    }
}
