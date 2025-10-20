#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerInfo2.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerInfo3 extends ICorProfilerInfo2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorProfilerInfo3
     * @type {Guid}
     */
    static IID => Guid("{b555ed4f-452a-4e54-8b39-b5360bad32a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 57

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumJITedFunctions", "RequestProfilerDetach", "SetFunctionIDMapper2", "GetStringLayout2", "SetEnterLeaveFunctionHooks3", "SetEnterLeaveFunctionHooks3WithInfo", "GetFunctionEnter3Info", "GetFunctionLeave3Info", "GetFunctionTailcall3Info", "EnumModules", "GetRuntimeInformation", "GetThreadStaticAddress2", "GetAppDomainsContainingModule", "GetModuleInfo2"]

    /**
     * 
     * @param {Pointer<ICorProfilerFunctionEnum>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumJITedFunctions(ppEnum) {
        result := ComCall(57, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwExpectedCompletionMilliseconds 
     * @returns {HRESULT} 
     */
    RequestProfilerDetach(dwExpectedCompletionMilliseconds) {
        result := ComCall(58, this, "uint", dwExpectedCompletionMilliseconds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<FunctionIDMapper2>>} pFunc 
     * @param {Pointer<Void>} clientData 
     * @returns {HRESULT} 
     */
    SetFunctionIDMapper2(pFunc, clientData) {
        result := ComCall(59, this, "ptr*", pFunc, "ptr", clientData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pStringLengthOffset 
     * @param {Pointer<Integer>} pBufferOffset 
     * @returns {HRESULT} 
     */
    GetStringLayout2(pStringLengthOffset, pBufferOffset) {
        result := ComCall(60, this, "uint*", pStringLengthOffset, "uint*", pBufferOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<FunctionEnter3>>} pFuncEnter3 
     * @param {Pointer<Pointer<FunctionLeave3>>} pFuncLeave3 
     * @param {Pointer<Pointer<FunctionTailcall3>>} pFuncTailcall3 
     * @returns {HRESULT} 
     */
    SetEnterLeaveFunctionHooks3(pFuncEnter3, pFuncLeave3, pFuncTailcall3) {
        result := ComCall(61, this, "ptr*", pFuncEnter3, "ptr*", pFuncLeave3, "ptr*", pFuncTailcall3, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<FunctionEnter3WithInfo>>} pFuncEnter3WithInfo 
     * @param {Pointer<Pointer<FunctionLeave3WithInfo>>} pFuncLeave3WithInfo 
     * @param {Pointer<Pointer<FunctionTailcall3WithInfo>>} pFuncTailcall3WithInfo 
     * @returns {HRESULT} 
     */
    SetEnterLeaveFunctionHooks3WithInfo(pFuncEnter3WithInfo, pFuncLeave3WithInfo, pFuncTailcall3WithInfo) {
        result := ComCall(62, this, "ptr*", pFuncEnter3WithInfo, "ptr*", pFuncLeave3WithInfo, "ptr*", pFuncTailcall3WithInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Pointer} eltInfo 
     * @param {Pointer<Pointer>} pFrameInfo 
     * @param {Pointer<Integer>} pcbArgumentInfo 
     * @param {Pointer<COR_PRF_FUNCTION_ARGUMENT_INFO>} pArgumentInfo 
     * @returns {HRESULT} 
     */
    GetFunctionEnter3Info(functionId, eltInfo, pFrameInfo, pcbArgumentInfo, pArgumentInfo) {
        result := ComCall(63, this, "ptr", functionId, "ptr", eltInfo, "ptr*", pFrameInfo, "uint*", pcbArgumentInfo, "ptr", pArgumentInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Pointer} eltInfo 
     * @param {Pointer<Pointer>} pFrameInfo 
     * @param {Pointer<COR_PRF_FUNCTION_ARGUMENT_RANGE>} pRetvalRange 
     * @returns {HRESULT} 
     */
    GetFunctionLeave3Info(functionId, eltInfo, pFrameInfo, pRetvalRange) {
        result := ComCall(64, this, "ptr", functionId, "ptr", eltInfo, "ptr*", pFrameInfo, "ptr", pRetvalRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Pointer} eltInfo 
     * @param {Pointer<Pointer>} pFrameInfo 
     * @returns {HRESULT} 
     */
    GetFunctionTailcall3Info(functionId, eltInfo, pFrameInfo) {
        result := ComCall(65, this, "ptr", functionId, "ptr", eltInfo, "ptr*", pFrameInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ICorProfilerModuleEnum>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumModules(ppEnum) {
        result := ComCall(66, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pClrInstanceId 
     * @param {Pointer<Integer>} pRuntimeType 
     * @param {Pointer<Integer>} pMajorVersion 
     * @param {Pointer<Integer>} pMinorVersion 
     * @param {Pointer<Integer>} pBuildNumber 
     * @param {Pointer<Integer>} pQFEVersion 
     * @param {Integer} cchVersionString 
     * @param {Pointer<Integer>} pcchVersionString 
     * @param {PWSTR} szVersionString 
     * @returns {HRESULT} 
     */
    GetRuntimeInformation(pClrInstanceId, pRuntimeType, pMajorVersion, pMinorVersion, pBuildNumber, pQFEVersion, cchVersionString, pcchVersionString, szVersionString) {
        szVersionString := szVersionString is String ? StrPtr(szVersionString) : szVersionString

        result := ComCall(67, this, "ushort*", pClrInstanceId, "int*", pRuntimeType, "ushort*", pMajorVersion, "ushort*", pMinorVersion, "ushort*", pBuildNumber, "ushort*", pQFEVersion, "uint", cchVersionString, "uint*", pcchVersionString, "ptr", szVersionString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Integer} fieldToken 
     * @param {Pointer} appDomainId 
     * @param {Pointer} threadId 
     * @param {Pointer<Pointer<Void>>} ppAddress 
     * @returns {HRESULT} 
     */
    GetThreadStaticAddress2(classId, fieldToken, appDomainId, threadId, ppAddress) {
        result := ComCall(68, this, "ptr", classId, "uint", fieldToken, "ptr", appDomainId, "ptr", threadId, "ptr*", ppAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {Integer} cAppDomainIds 
     * @param {Pointer<Integer>} pcAppDomainIds 
     * @param {Pointer<Pointer>} appDomainIds 
     * @returns {HRESULT} 
     */
    GetAppDomainsContainingModule(moduleId, cAppDomainIds, pcAppDomainIds, appDomainIds) {
        result := ComCall(69, this, "ptr", moduleId, "uint", cAppDomainIds, "uint*", pcAppDomainIds, "ptr*", appDomainIds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {Pointer<Pointer<Integer>>} ppBaseLoadAddress 
     * @param {Integer} cchName 
     * @param {Pointer<Integer>} pcchName 
     * @param {PWSTR} szName 
     * @param {Pointer<Pointer>} pAssemblyId 
     * @param {Pointer<Integer>} pdwModuleFlags 
     * @returns {HRESULT} 
     */
    GetModuleInfo2(moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId, pdwModuleFlags) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(70, this, "ptr", moduleId, "ptr*", ppBaseLoadAddress, "uint", cchName, "uint*", pcchName, "ptr", szName, "ptr*", pAssemblyId, "uint*", pdwModuleFlags, "HRESULT")
        return result
    }
}
