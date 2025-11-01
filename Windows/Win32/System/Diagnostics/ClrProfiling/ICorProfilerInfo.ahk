#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorProfilerInfo
     * @type {Guid}
     */
    static IID => Guid("{28b5557d-3f3f-48b4-90b2-5f9eea2f6c48}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetClassFromObject", "GetClassFromToken", "GetCodeInfo", "GetEventMask", "GetFunctionFromIP", "GetFunctionFromToken", "GetHandleFromThread", "GetObjectSize", "IsArrayClass", "GetThreadInfo", "GetCurrentThreadID", "GetClassIDInfo", "GetFunctionInfo", "SetEventMask", "SetEnterLeaveFunctionHooks", "SetFunctionIDMapper", "GetTokenAndMetaDataFromFunction", "GetModuleInfo", "GetModuleMetaData", "GetILFunctionBody", "GetILFunctionBodyAllocator", "SetILFunctionBody", "GetAppDomainInfo", "GetAssemblyInfo", "SetFunctionReJIT", "ForceGC", "SetILInstrumentedCodeMap", "GetInprocInspectionInterface", "GetInprocInspectionIThisThread", "GetThreadContext", "BeginInprocDebugging", "EndInprocDebugging", "GetILToNativeMapping"]

    /**
     * 
     * @param {Pointer} objectId 
     * @param {Pointer<Pointer>} pClassId 
     * @returns {HRESULT} 
     */
    GetClassFromObject(objectId, pClassId) {
        result := ComCall(3, this, "ptr", objectId, "ptr*", pClassId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {Integer} typeDef 
     * @param {Pointer<Pointer>} pClassId 
     * @returns {HRESULT} 
     */
    GetClassFromToken(moduleId, typeDef, pClassId) {
        result := ComCall(4, this, "ptr", moduleId, "uint", typeDef, "ptr*", pClassId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Pointer<Pointer<Integer>>} pStart 
     * @param {Pointer<Integer>} pcSize 
     * @returns {HRESULT} 
     */
    GetCodeInfo(functionId, pStart, pcSize) {
        result := ComCall(5, this, "ptr", functionId, "ptr*", pStart, "uint*", pcSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwEvents 
     * @returns {HRESULT} 
     */
    GetEventMask(pdwEvents) {
        result := ComCall(6, this, "uint*", pdwEvents, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} ip 
     * @param {Pointer<Pointer>} pFunctionId 
     * @returns {HRESULT} 
     */
    GetFunctionFromIP(ip, pFunctionId) {
        result := ComCall(7, this, "char*", ip, "ptr*", pFunctionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {Integer} token 
     * @param {Pointer<Pointer>} pFunctionId 
     * @returns {HRESULT} 
     */
    GetFunctionFromToken(moduleId, token, pFunctionId) {
        result := ComCall(8, this, "ptr", moduleId, "uint", token, "ptr*", pFunctionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} threadId 
     * @param {Pointer<HANDLE>} phThread 
     * @returns {HRESULT} 
     */
    GetHandleFromThread(threadId, phThread) {
        result := ComCall(9, this, "ptr", threadId, "ptr", phThread, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} objectId 
     * @param {Pointer<Integer>} pcSize 
     * @returns {HRESULT} 
     */
    GetObjectSize(objectId, pcSize) {
        result := ComCall(10, this, "ptr", objectId, "uint*", pcSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Pointer<Integer>} pBaseElemType 
     * @param {Pointer<Pointer>} pBaseClassId 
     * @param {Pointer<Integer>} pcRank 
     * @returns {HRESULT} 
     */
    IsArrayClass(classId, pBaseElemType, pBaseClassId, pcRank) {
        result := ComCall(11, this, "ptr", classId, "char*", pBaseElemType, "ptr*", pBaseClassId, "uint*", pcRank, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} threadId 
     * @param {Pointer<Integer>} pdwWin32ThreadId 
     * @returns {HRESULT} 
     */
    GetThreadInfo(threadId, pdwWin32ThreadId) {
        result := ComCall(12, this, "ptr", threadId, "uint*", pdwWin32ThreadId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} pThreadId 
     * @returns {HRESULT} 
     */
    GetCurrentThreadID(pThreadId) {
        result := ComCall(13, this, "ptr*", pThreadId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Pointer<Pointer>} pModuleId 
     * @param {Pointer<Integer>} pTypeDefToken 
     * @returns {HRESULT} 
     */
    GetClassIDInfo(classId, pModuleId, pTypeDefToken) {
        result := ComCall(14, this, "ptr", classId, "ptr*", pModuleId, "uint*", pTypeDefToken, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Pointer<Pointer>} pClassId 
     * @param {Pointer<Pointer>} pModuleId 
     * @param {Pointer<Integer>} pToken 
     * @returns {HRESULT} 
     */
    GetFunctionInfo(functionId, pClassId, pModuleId, pToken) {
        result := ComCall(15, this, "ptr", functionId, "ptr*", pClassId, "ptr*", pModuleId, "uint*", pToken, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwEvents 
     * @returns {HRESULT} 
     */
    SetEventMask(dwEvents) {
        result := ComCall(16, this, "uint", dwEvents, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<FunctionEnter>>} pFuncEnter 
     * @param {Pointer<Pointer<FunctionLeave>>} pFuncLeave 
     * @param {Pointer<Pointer<FunctionTailcall>>} pFuncTailcall 
     * @returns {HRESULT} 
     */
    SetEnterLeaveFunctionHooks(pFuncEnter, pFuncLeave, pFuncTailcall) {
        result := ComCall(17, this, "ptr*", pFuncEnter, "ptr*", pFuncLeave, "ptr*", pFuncTailcall, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<FunctionIDMapper>>} pFunc 
     * @returns {HRESULT} 
     */
    SetFunctionIDMapper(pFunc) {
        result := ComCall(18, this, "ptr*", pFunc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppImport 
     * @param {Pointer<Integer>} pToken 
     * @returns {HRESULT} 
     */
    GetTokenAndMetaDataFromFunction(functionId, riid, ppImport, pToken) {
        result := ComCall(19, this, "ptr", functionId, "ptr", riid, "ptr*", ppImport, "uint*", pToken, "HRESULT")
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
     * @returns {HRESULT} 
     */
    GetModuleInfo(moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(20, this, "ptr", moduleId, "ptr*", ppBaseLoadAddress, "uint", cchName, "uint*", pcchName, "ptr", szName, "ptr*", pAssemblyId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {Integer} dwOpenFlags 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppOut 
     * @returns {HRESULT} 
     */
    GetModuleMetaData(moduleId, dwOpenFlags, riid, ppOut) {
        result := ComCall(21, this, "ptr", moduleId, "uint", dwOpenFlags, "ptr", riid, "ptr*", ppOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {Integer} methodId 
     * @param {Pointer<Pointer<Integer>>} ppMethodHeader 
     * @param {Pointer<Integer>} pcbMethodSize 
     * @returns {HRESULT} 
     */
    GetILFunctionBody(moduleId, methodId, ppMethodHeader, pcbMethodSize) {
        result := ComCall(22, this, "ptr", moduleId, "uint", methodId, "ptr*", ppMethodHeader, "uint*", pcbMethodSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {Pointer<IMethodMalloc>} ppMalloc 
     * @returns {HRESULT} 
     */
    GetILFunctionBodyAllocator(moduleId, ppMalloc) {
        result := ComCall(23, this, "ptr", moduleId, "ptr*", ppMalloc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {Integer} methodid 
     * @param {Pointer<Integer>} pbNewILMethodHeader 
     * @returns {HRESULT} 
     */
    SetILFunctionBody(moduleId, methodid, pbNewILMethodHeader) {
        result := ComCall(24, this, "ptr", moduleId, "uint", methodid, "char*", pbNewILMethodHeader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} appDomainId 
     * @param {Integer} cchName 
     * @param {Pointer<Integer>} pcchName 
     * @param {PWSTR} szName 
     * @param {Pointer<Pointer>} pProcessId 
     * @returns {HRESULT} 
     */
    GetAppDomainInfo(appDomainId, cchName, pcchName, szName, pProcessId) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(25, this, "ptr", appDomainId, "uint", cchName, "uint*", pcchName, "ptr", szName, "ptr*", pProcessId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} assemblyId 
     * @param {Integer} cchName 
     * @param {Pointer<Integer>} pcchName 
     * @param {PWSTR} szName 
     * @param {Pointer<Pointer>} pAppDomainId 
     * @param {Pointer<Pointer>} pModuleId 
     * @returns {HRESULT} 
     */
    GetAssemblyInfo(assemblyId, cchName, pcchName, szName, pAppDomainId, pModuleId) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(26, this, "ptr", assemblyId, "uint", cchName, "uint*", pcchName, "ptr", szName, "ptr*", pAppDomainId, "ptr*", pModuleId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @returns {HRESULT} 
     */
    SetFunctionReJIT(functionId) {
        result := ComCall(27, this, "ptr", functionId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ForceGC() {
        result := ComCall(28, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {BOOL} fStartJit 
     * @param {Integer} cILMapEntries 
     * @param {Pointer<COR_IL_MAP>} rgILMapEntries 
     * @returns {HRESULT} 
     */
    SetILInstrumentedCodeMap(functionId, fStartJit, cILMapEntries, rgILMapEntries) {
        result := ComCall(29, this, "ptr", functionId, "int", fStartJit, "uint", cILMapEntries, "ptr", rgILMapEntries, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppicd 
     * @returns {HRESULT} 
     */
    GetInprocInspectionInterface(ppicd) {
        result := ComCall(30, this, "ptr*", ppicd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppicd 
     * @returns {HRESULT} 
     */
    GetInprocInspectionIThisThread(ppicd) {
        result := ComCall(31, this, "ptr*", ppicd, "HRESULT")
        return result
    }

    /**
     * Retrieves the context of the specified thread.
     * @param {Pointer} threadId 
     * @param {Pointer<Pointer>} pContextId 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getthreadcontext
     */
    GetThreadContext(threadId, pContextId) {
        result := ComCall(32, this, "ptr", threadId, "ptr*", pContextId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fThisThreadOnly 
     * @param {Pointer<Integer>} pdwProfilerContext 
     * @returns {HRESULT} 
     */
    BeginInprocDebugging(fThisThreadOnly, pdwProfilerContext) {
        result := ComCall(33, this, "int", fThisThreadOnly, "uint*", pdwProfilerContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwProfilerContext 
     * @returns {HRESULT} 
     */
    EndInprocDebugging(dwProfilerContext) {
        result := ComCall(34, this, "uint", dwProfilerContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Integer} cMap 
     * @param {Pointer<Integer>} pcMap 
     * @param {Pointer<COR_DEBUG_IL_TO_NATIVE_MAP>} map 
     * @returns {HRESULT} 
     */
    GetILToNativeMapping(functionId, cMap, pcMap, map) {
        result := ComCall(35, this, "ptr", functionId, "uint", cMap, "uint*", pcMap, "ptr", map, "HRESULT")
        return result
    }
}
