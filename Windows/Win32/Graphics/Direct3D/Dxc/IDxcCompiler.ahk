#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DxcDefine.ahk" { DxcDefine }
#Import ".\IDxcBlob.ahk" { IDxcBlob }
#Import ".\IDxcBlobEncoding.ahk" { IDxcBlobEncoding }
#Import ".\IDxcIncludeHandler.ahk" { IDxcIncludeHandler }
#Import ".\IDxcOperationResult.ahk" { IDxcOperationResult }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

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

        pSourceNameMarshal := pSourceName == 0 ? IntPtr : PWSTR
        pEntryPointMarshal := pEntryPoint == 0 ? IntPtr : PWSTR
        pArgumentsMarshal := pArguments is VarRef ? "ptr*" : IntPtr
        pArgumentsMarshal := pArguments == 0 ? IntPtr : PWSTR.Ptr
        pIncludeHandlerMarshal := pIncludeHandler == 0 ? IntPtr : "ptr"

        result := ComCall(3, this, "ptr", pSource, pSourceNameMarshal, pSourceName, pEntryPointMarshal, pEntryPoint, "ptr", pTargetProfile, pArgumentsMarshal, pArguments, UInt32, argCount, DxcDefine.Ptr, pDefines, UInt32, defineCount, pIncludeHandlerMarshal, pIncludeHandler, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcOperationResult(ppResult)
    }

    /**
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

        pSourceNameMarshal := pSourceName == 0 ? IntPtr : PWSTR
        pArgumentsMarshal := pArguments is VarRef ? "ptr*" : IntPtr
        pArgumentsMarshal := pArguments == 0 ? IntPtr : PWSTR.Ptr
        pIncludeHandlerMarshal := pIncludeHandler == 0 ? IntPtr : "ptr"

        result := ComCall(4, this, "ptr", pSource, pSourceNameMarshal, pSourceName, pArgumentsMarshal, pArguments, UInt32, argCount, DxcDefine.Ptr, pDefines, UInt32, defineCount, pIncludeHandlerMarshal, pIncludeHandler, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcOperationResult(ppResult)
    }

    /**
     * @param {IDxcBlob} pSource 
     * @returns {IDxcBlobEncoding} 
     */
    Disassemble(pSource) {
        result := ComCall(5, this, "ptr", pSource, "ptr*", &ppDisassembly := 0, "HRESULT")
        return IDxcBlobEncoding(ppDisassembly)
    }

    _Query(iid) {
        if (IDxcCompiler.IID.Equals(iid)) {
            return true
        }
        return super._Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Compile := CallbackCreate(ObjBindMethod(implObj, "Compile"), flags, 11)
        this.vtbl.Preprocess := CallbackCreate(ObjBindMethod(implObj, "Preprocess"), flags, 9)
        this.vtbl.Disassemble := CallbackCreate(ObjBindMethod(implObj, "Disassemble"), flags, 3)
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
