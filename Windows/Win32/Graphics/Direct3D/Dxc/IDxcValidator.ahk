#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDxcOperationResult.ahk" { IDxcOperationResult }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDxcBlob.ahk" { IDxcBlob }

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
export default struct IDxcValidator extends IUnknown {
    /**
     * The interface identifier for IDxcValidator
     * @type {Guid}
     */
    static IID := Guid("{a6e82bd2-1fd7-4826-9811-2857e797f49a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDxcValidator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Validate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDxcValidator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDxcBlob} pShader 
     * @param {Integer} Flags 
     * @returns {IDxcOperationResult} 
     */
    Validate(pShader, Flags) {
        result := ComCall(3, this, "ptr", pShader, "uint", Flags, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcOperationResult(ppResult)
    }

    Query(iid) {
        if (IDxcValidator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Validate := CallbackCreate(GetMethod(implObj, "Validate"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Validate)
    }
}
