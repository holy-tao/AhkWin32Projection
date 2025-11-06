#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerFunctionEnum.ahk
#Include .\ICorProfilerModuleEnum.ahk
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
     * @returns {ICorProfilerFunctionEnum} 
     */
    EnumJITedFunctions() {
        result := ComCall(57, this, "ptr*", &ppEnum := 0, "HRESULT")
        return ICorProfilerFunctionEnum(ppEnum)
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
        pFuncMarshal := pFunc is VarRef ? "ptr*" : "ptr"
        clientDataMarshal := clientData is VarRef ? "ptr" : "ptr"

        result := ComCall(59, this, pFuncMarshal, pFunc, clientDataMarshal, clientData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pStringLengthOffset 
     * @param {Pointer<Integer>} pBufferOffset 
     * @returns {HRESULT} 
     */
    GetStringLayout2(pStringLengthOffset, pBufferOffset) {
        pStringLengthOffsetMarshal := pStringLengthOffset is VarRef ? "uint*" : "ptr"
        pBufferOffsetMarshal := pBufferOffset is VarRef ? "uint*" : "ptr"

        result := ComCall(60, this, pStringLengthOffsetMarshal, pStringLengthOffset, pBufferOffsetMarshal, pBufferOffset, "HRESULT")
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
        pFuncEnter3Marshal := pFuncEnter3 is VarRef ? "ptr*" : "ptr"
        pFuncLeave3Marshal := pFuncLeave3 is VarRef ? "ptr*" : "ptr"
        pFuncTailcall3Marshal := pFuncTailcall3 is VarRef ? "ptr*" : "ptr"

        result := ComCall(61, this, pFuncEnter3Marshal, pFuncEnter3, pFuncLeave3Marshal, pFuncLeave3, pFuncTailcall3Marshal, pFuncTailcall3, "HRESULT")
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
        pFuncEnter3WithInfoMarshal := pFuncEnter3WithInfo is VarRef ? "ptr*" : "ptr"
        pFuncLeave3WithInfoMarshal := pFuncLeave3WithInfo is VarRef ? "ptr*" : "ptr"
        pFuncTailcall3WithInfoMarshal := pFuncTailcall3WithInfo is VarRef ? "ptr*" : "ptr"

        result := ComCall(62, this, pFuncEnter3WithInfoMarshal, pFuncEnter3WithInfo, pFuncLeave3WithInfoMarshal, pFuncLeave3WithInfo, pFuncTailcall3WithInfoMarshal, pFuncTailcall3WithInfo, "HRESULT")
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
        pFrameInfoMarshal := pFrameInfo is VarRef ? "ptr*" : "ptr"
        pcbArgumentInfoMarshal := pcbArgumentInfo is VarRef ? "uint*" : "ptr"

        result := ComCall(63, this, "ptr", functionId, "ptr", eltInfo, pFrameInfoMarshal, pFrameInfo, pcbArgumentInfoMarshal, pcbArgumentInfo, "ptr", pArgumentInfo, "HRESULT")
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
        pFrameInfoMarshal := pFrameInfo is VarRef ? "ptr*" : "ptr"

        result := ComCall(64, this, "ptr", functionId, "ptr", eltInfo, pFrameInfoMarshal, pFrameInfo, "ptr", pRetvalRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Pointer} eltInfo 
     * @returns {Pointer} 
     */
    GetFunctionTailcall3Info(functionId, eltInfo) {
        result := ComCall(65, this, "ptr", functionId, "ptr", eltInfo, "ptr*", &pFrameInfo := 0, "HRESULT")
        return pFrameInfo
    }

    /**
     * 
     * @returns {ICorProfilerModuleEnum} 
     */
    EnumModules() {
        result := ComCall(66, this, "ptr*", &ppEnum := 0, "HRESULT")
        return ICorProfilerModuleEnum(ppEnum)
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

        pClrInstanceIdMarshal := pClrInstanceId is VarRef ? "ushort*" : "ptr"
        pRuntimeTypeMarshal := pRuntimeType is VarRef ? "int*" : "ptr"
        pMajorVersionMarshal := pMajorVersion is VarRef ? "ushort*" : "ptr"
        pMinorVersionMarshal := pMinorVersion is VarRef ? "ushort*" : "ptr"
        pBuildNumberMarshal := pBuildNumber is VarRef ? "ushort*" : "ptr"
        pQFEVersionMarshal := pQFEVersion is VarRef ? "ushort*" : "ptr"
        pcchVersionStringMarshal := pcchVersionString is VarRef ? "uint*" : "ptr"

        result := ComCall(67, this, pClrInstanceIdMarshal, pClrInstanceId, pRuntimeTypeMarshal, pRuntimeType, pMajorVersionMarshal, pMajorVersion, pMinorVersionMarshal, pMinorVersion, pBuildNumberMarshal, pBuildNumber, pQFEVersionMarshal, pQFEVersion, "uint", cchVersionString, pcchVersionStringMarshal, pcchVersionString, "ptr", szVersionString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Integer} fieldToken 
     * @param {Pointer} appDomainId 
     * @param {Pointer} threadId 
     * @returns {Pointer<Void>} 
     */
    GetThreadStaticAddress2(classId, fieldToken, appDomainId, threadId) {
        result := ComCall(68, this, "ptr", classId, "uint", fieldToken, "ptr", appDomainId, "ptr", threadId, "ptr*", &ppAddress := 0, "HRESULT")
        return ppAddress
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
        pcAppDomainIdsMarshal := pcAppDomainIds is VarRef ? "uint*" : "ptr"
        appDomainIdsMarshal := appDomainIds is VarRef ? "ptr*" : "ptr"

        result := ComCall(69, this, "ptr", moduleId, "uint", cAppDomainIds, pcAppDomainIdsMarshal, pcAppDomainIds, appDomainIdsMarshal, appDomainIds, "HRESULT")
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

        ppBaseLoadAddressMarshal := ppBaseLoadAddress is VarRef ? "ptr*" : "ptr"
        pcchNameMarshal := pcchName is VarRef ? "uint*" : "ptr"
        pAssemblyIdMarshal := pAssemblyId is VarRef ? "ptr*" : "ptr"
        pdwModuleFlagsMarshal := pdwModuleFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(70, this, "ptr", moduleId, ppBaseLoadAddressMarshal, ppBaseLoadAddress, "uint", cchName, pcchNameMarshal, pcchName, "ptr", szName, pAssemblyIdMarshal, pAssemblyId, pdwModuleFlagsMarshal, pdwModuleFlags, "HRESULT")
        return result
    }
}
