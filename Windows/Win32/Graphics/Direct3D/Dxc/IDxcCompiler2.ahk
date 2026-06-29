#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DxcDefine.ahk" { DxcDefine }
#Import ".\IDxcOperationResult.ahk" { IDxcOperationResult }
#Import ".\IDxcIncludeHandler.ahk" { IDxcIncludeHandler }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDxcCompiler.ahk" { IDxcCompiler }
#Import ".\IDxcBlob.ahk" { IDxcBlob }

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
export default struct IDxcCompiler2 extends IDxcCompiler {
    /**
     * The interface identifier for IDxcCompiler2
     * @type {Guid}
     */
    static IID := Guid("{a005a9d9-b8bb-4594-b5c9-0e633bec4d37}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDxcCompiler2 interfaces
    */
    struct Vtbl extends IDxcCompiler.Vtbl {
        CompileWithDebug : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDxcCompiler2.Vtbl()
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
     * @param {Pointer<IDxcOperationResult>} ppResult 
     * @param {Pointer<PWSTR>} ppDebugBlobName 
     * @param {Pointer<IDxcBlob>} ppDebugBlob 
     * @returns {HRESULT} 
     */
    CompileWithDebug(pSource, pSourceName, pEntryPoint, pTargetProfile, pArguments, argCount, pDefines, defineCount, pIncludeHandler, ppResult, ppDebugBlobName, ppDebugBlob) {
        pSourceName := pSourceName is String ? StrPtr(pSourceName) : pSourceName
        pEntryPoint := pEntryPoint is String ? StrPtr(pEntryPoint) : pEntryPoint
        pTargetProfile := pTargetProfile is String ? StrPtr(pTargetProfile) : pTargetProfile

        pArgumentsMarshal := pArguments is VarRef ? "ptr*" : "ptr"
        ppDebugBlobNameMarshal := ppDebugBlobName is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", pSource, "ptr", pSourceName, "ptr", pEntryPoint, "ptr", pTargetProfile, pArgumentsMarshal, pArguments, "uint", argCount, DxcDefine.Ptr, pDefines, "uint", defineCount, "ptr", pIncludeHandler, IDxcOperationResult.Ptr, ppResult, ppDebugBlobNameMarshal, ppDebugBlobName, IDxcBlob.Ptr, ppDebugBlob, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDxcCompiler2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CompileWithDebug := CallbackCreate(GetMethod(implObj, "CompileWithDebug"), flags, 13)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CompileWithDebug)
    }
}
