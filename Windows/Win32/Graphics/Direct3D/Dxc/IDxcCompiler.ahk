#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcCompiler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDxcCompiler
     * @type {Guid}
     */
    static IID => Guid("{8c210bf3-011f-4422-8d70-6f9acb8db617}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Compile", "Preprocess", "Disassemble"]

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
     * @returns {HRESULT} 
     */
    Compile(pSource, pSourceName, pEntryPoint, pTargetProfile, pArguments, argCount, pDefines, defineCount, pIncludeHandler, ppResult) {
        pSourceName := pSourceName is String ? StrPtr(pSourceName) : pSourceName
        pEntryPoint := pEntryPoint is String ? StrPtr(pEntryPoint) : pEntryPoint
        pTargetProfile := pTargetProfile is String ? StrPtr(pTargetProfile) : pTargetProfile

        result := ComCall(3, this, "ptr", pSource, "ptr", pSourceName, "ptr", pEntryPoint, "ptr", pTargetProfile, "ptr", pArguments, "uint", argCount, "ptr", pDefines, "uint", defineCount, "ptr", pIncludeHandler, "ptr*", ppResult, "HRESULT")
        return result
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
     * @param {Pointer<IDxcOperationResult>} ppResult 
     * @returns {HRESULT} 
     */
    Preprocess(pSource, pSourceName, pArguments, argCount, pDefines, defineCount, pIncludeHandler, ppResult) {
        pSourceName := pSourceName is String ? StrPtr(pSourceName) : pSourceName

        result := ComCall(4, this, "ptr", pSource, "ptr", pSourceName, "ptr", pArguments, "uint", argCount, "ptr", pDefines, "uint", defineCount, "ptr", pIncludeHandler, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDxcBlob} pSource 
     * @param {Pointer<IDxcBlobEncoding>} ppDisassembly 
     * @returns {HRESULT} 
     */
    Disassemble(pSource, ppDisassembly) {
        result := ComCall(5, this, "ptr", pSource, "ptr*", ppDisassembly, "HRESULT")
        return result
    }
}
