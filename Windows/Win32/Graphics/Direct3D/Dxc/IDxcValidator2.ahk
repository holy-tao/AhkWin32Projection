#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DxcBuffer.ahk" { DxcBuffer }
#Import ".\IDxcBlob.ahk" { IDxcBlob }
#Import ".\IDxcOperationResult.ahk" { IDxcOperationResult }
#Import ".\IDxcValidator.ahk" { IDxcValidator }

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
export default struct IDxcValidator2 extends IDxcValidator {
    /**
     * The interface identifier for IDxcValidator2
     * @type {Guid}
     */
    static IID := Guid("{458e1fd1-b1b2-4750-a6e1-9c10f03bed92}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDxcValidator2 interfaces
    */
    struct Vtbl extends IDxcValidator.Vtbl {
        ValidateWithDebug : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDxcValidator2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDxcBlob} pShader 
     * @param {Integer} Flags 
     * @param {Pointer<DxcBuffer>} pOptDebugBitcode 
     * @returns {IDxcOperationResult} 
     */
    ValidateWithDebug(pShader, Flags, pOptDebugBitcode) {
        result := ComCall(4, this, "ptr", pShader, UInt32, Flags, DxcBuffer.Ptr, pOptDebugBitcode, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcOperationResult(ppResult)
    }

    _Query(iid) {
        if (IDxcValidator2.IID.Equals(iid)) {
            return true
        }
        return super._Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ValidateWithDebug := CallbackCreate(GetMethod(implObj, "ValidateWithDebug"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ValidateWithDebug)
    }
}
