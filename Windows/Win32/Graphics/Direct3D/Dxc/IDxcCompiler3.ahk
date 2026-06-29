#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DxcBuffer.ahk" { DxcBuffer }
#Import ".\IDxcIncludeHandler.ahk" { IDxcIncludeHandler }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
export default struct IDxcCompiler3 extends IUnknown {
    /**
     * The interface identifier for IDxcCompiler3
     * @type {Guid}
     */
    static IID := Guid("{228b4687-5a6a-4730-900c-9702b2203f54}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDxcCompiler3 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Compile     : IntPtr
        Disassemble : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDxcCompiler3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<DxcBuffer>} pSource 
     * @param {Pointer<PWSTR>} pArguments 
     * @param {Integer} argCount 
     * @param {IDxcIncludeHandler} pIncludeHandler 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    Compile(pSource, pArguments, argCount, pIncludeHandler, riid) {
        pArgumentsMarshal := pArguments is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, DxcBuffer.Ptr, pSource, pArgumentsMarshal, pArguments, "uint", argCount, "ptr", pIncludeHandler, Guid.Ptr, riid, "ptr*", &ppResult := 0, "HRESULT")
        return ppResult
    }

    /**
     * 
     * @param {Pointer<DxcBuffer>} pObject 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    Disassemble(pObject, riid) {
        result := ComCall(4, this, DxcBuffer.Ptr, pObject, Guid.Ptr, riid, "ptr*", &ppResult := 0, "HRESULT")
        return ppResult
    }

    Query(iid) {
        if (IDxcCompiler3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Compile := CallbackCreate(GetMethod(implObj, "Compile"), flags, 7)
        this.vtbl.Disassemble := CallbackCreate(GetMethod(implObj, "Disassemble"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Compile)
        CallbackFree(this.vtbl.Disassemble)
    }
}
