#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDxcCompiler.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcCompiler2 extends IDxcCompiler{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDxcCompiler2
     * @type {Guid}
     */
    static IID => Guid("{a005a9d9-b8bb-4594-b5c9-0e633bec4d37}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CompileWithDebug"]

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

        result := ComCall(6, this, "ptr", pSource, "ptr", pSourceName, "ptr", pEntryPoint, "ptr", pTargetProfile, "ptr", pArguments, "uint", argCount, "ptr", pDefines, "uint", defineCount, "ptr", pIncludeHandler, "ptr*", ppResult, "ptr", ppDebugBlobName, "ptr*", ppDebugBlob, "HRESULT")
        return result
    }
}
