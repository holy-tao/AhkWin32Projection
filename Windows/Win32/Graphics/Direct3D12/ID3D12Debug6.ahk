#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12Debug5.ahk" { ID3D12Debug5 }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * A debug interface controls debug settings.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debug6
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12Debug6 extends ID3D12Debug5 {
    /**
     * The interface identifier for ID3D12Debug6
     * @type {Guid}
     */
    static IID := Guid("{82a816d6-5d01-4157-97d0-4975463fd1ed}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12Debug6 interfaces
    */
    struct Vtbl extends ID3D12Debug5.Vtbl {
        SetForceLegacyBarrierValidation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12Debug6.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * TBD
     * @param {BOOL} Enable 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debug6-setforcelegacybarriervalidation
     */
    SetForceLegacyBarrierValidation(Enable) {
        ComCall(9, this, BOOL, Enable)
    }

    Query(iid) {
        if (ID3D12Debug6.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetForceLegacyBarrierValidation := CallbackCreate(GetMethod(implObj, "SetForceLegacyBarrierValidation"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetForceLegacyBarrierValidation)
    }
}
