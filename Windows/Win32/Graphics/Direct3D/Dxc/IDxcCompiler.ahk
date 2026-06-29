#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DxcDefine.ahk" { DxcDefine }
#Import ".\IDxcOperationResult.ahk" { IDxcOperationResult }
#Import ".\IDxcIncludeHandler.ahk" { IDxcIncludeHandler }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDxcBlobEncoding.ahk" { IDxcBlobEncoding }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDxcBlob.ahk" { IDxcBlob }

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
export default struct IDxcCompiler extends IUnknown {
    /**
     * The interface identifier for IDxcCompiler
     * @type {Guid}
     */
    static IID := Guid("{8c210bf3-011f-4422-8d70-6f9acb8db617}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDxcCompiler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Compile     : IntPtr
        Preprocess  : IntPtr
        Disassemble : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDxcCompiler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDxcBlob} pSource 
     * @param {PWSTR} pSourceName 
     * @param {PWSTR} pEntryPoint 
     * @param {PWSTR} pTargetProfile 
     * @param {Pointer<PWSTR>} pArguments 
     * @param {Integer} argCount 
     * @param {Pointer<DxcDefine>} pDefines 
     * @param {Integer} defineCount 
     * @param {IDxcIncludeHandler} pIncludeHandler 
     * @returns {IDxcOperationResult} 
     */
    Compile(pSource, pSourceName, pEntryPoint, pTargetProfile, pArguments, argCount, pDefines, defineCount, pIncludeHandler) {
        pSourceName := pSourceName is String ? StrPtr(pSourceName) : pSourceName
        pEntryPoint := pEntryPoint is String ? StrPtr(pEntryPoint) : pEntryPoint
        pTargetProfile := pTargetProfile is String ? StrPtr(pTargetProfile) : pTargetProfile

        pArgumentsMarshal := pArguments is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pSource, "ptr", pSourceName, "ptr", pEntryPoint, "ptr", pTargetProfile, pArgumentsMarshal, pArguments, "uint", argCount, DxcDefine.Ptr, pDefines, "uint", defineCount, "ptr", pIncludeHandler, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcOperationResult(ppResult)
    }

    /**
     * 
     * @param {IDxcBlob} pSource 
     * @param {PWSTR} pSourceName 
     * @param {Pointer<PWSTR>} pArguments 
     * @param {Integer} argCount 
     * @param {Pointer<DxcDefine>} pDefines 
     * @param {Integer} defineCount 
     * @param {IDxcIncludeHandler} pIncludeHandler 
     * @returns {IDxcOperationResult} 
     */
    Preprocess(pSource, pSourceName, pArguments, argCount, pDefines, defineCount, pIncludeHandler) {
        pSourceName := pSourceName is String ? StrPtr(pSourceName) : pSourceName

        pArgumentsMarshal := pArguments is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pSource, "ptr", pSourceName, pArgumentsMarshal, pArguments, "uint", argCount, DxcDefine.Ptr, pDefines, "uint", defineCount, "ptr", pIncludeHandler, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcOperationResult(ppResult)
    }

    /**
     * 
     * @param {IDxcBlob} pSource 
     * @returns {IDxcBlobEncoding} 
     */
    Disassemble(pSource) {
        result := ComCall(5, this, "ptr", pSource, "ptr*", &ppDisassembly := 0, "HRESULT")
        return IDxcBlobEncoding(ppDisassembly)
    }

    Query(iid) {
        if (IDxcCompiler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Compile := CallbackCreate(GetMethod(implObj, "Compile"), flags, 11)
        this.vtbl.Preprocess := CallbackCreate(GetMethod(implObj, "Preprocess"), flags, 9)
        this.vtbl.Disassemble := CallbackCreate(GetMethod(implObj, "Disassemble"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Compile)
        CallbackFree(this.vtbl.Preprocess)
        CallbackFree(this.vtbl.Disassemble)
    }
}
