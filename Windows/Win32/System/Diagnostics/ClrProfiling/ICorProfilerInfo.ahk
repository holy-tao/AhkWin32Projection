#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerInfo extends IUnknown{
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
     * 
     * @param {Pointer} objectId 
     * @param {Pointer<UIntPtr>} pClassId 
     * @returns {HRESULT} 
     */
    GetClassFromObject(objectId, pClassId) {
        result := ComCall(3, this, "ptr", objectId, "ptr*", pClassId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {Integer} typeDef 
     * @param {Pointer<UIntPtr>} pClassId 
     * @returns {HRESULT} 
     */
    GetClassFromToken(moduleId, typeDef, pClassId) {
        result := ComCall(4, this, "ptr", moduleId, "uint", typeDef, "ptr*", pClassId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Pointer<Byte>} pStart 
     * @param {Pointer<UInt32>} pcSize 
     * @returns {HRESULT} 
     */
    GetCodeInfo(functionId, pStart, pcSize) {
        result := ComCall(5, this, "ptr", functionId, "char*", pStart, "uint*", pcSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwEvents 
     * @returns {HRESULT} 
     */
    GetEventMask(pdwEvents) {
        result := ComCall(6, this, "uint*", pdwEvents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} ip 
     * @param {Pointer<UIntPtr>} pFunctionId 
     * @returns {HRESULT} 
     */
    GetFunctionFromIP(ip, pFunctionId) {
        result := ComCall(7, this, "char*", ip, "ptr*", pFunctionId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {Integer} token 
     * @param {Pointer<UIntPtr>} pFunctionId 
     * @returns {HRESULT} 
     */
    GetFunctionFromToken(moduleId, token, pFunctionId) {
        result := ComCall(8, this, "ptr", moduleId, "uint", token, "ptr*", pFunctionId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} threadId 
     * @param {Pointer<HANDLE>} phThread 
     * @returns {HRESULT} 
     */
    GetHandleFromThread(threadId, phThread) {
        result := ComCall(9, this, "ptr", threadId, "ptr", phThread, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} objectId 
     * @param {Pointer<UInt32>} pcSize 
     * @returns {HRESULT} 
     */
    GetObjectSize(objectId, pcSize) {
        result := ComCall(10, this, "ptr", objectId, "uint*", pcSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Pointer<Byte>} pBaseElemType 
     * @param {Pointer<UIntPtr>} pBaseClassId 
     * @param {Pointer<UInt32>} pcRank 
     * @returns {HRESULT} 
     */
    IsArrayClass(classId, pBaseElemType, pBaseClassId, pcRank) {
        result := ComCall(11, this, "ptr", classId, "char*", pBaseElemType, "ptr*", pBaseClassId, "uint*", pcRank, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} threadId 
     * @param {Pointer<UInt32>} pdwWin32ThreadId 
     * @returns {HRESULT} 
     */
    GetThreadInfo(threadId, pdwWin32ThreadId) {
        result := ComCall(12, this, "ptr", threadId, "uint*", pdwWin32ThreadId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UIntPtr>} pThreadId 
     * @returns {HRESULT} 
     */
    GetCurrentThreadID(pThreadId) {
        result := ComCall(13, this, "ptr*", pThreadId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Pointer<UIntPtr>} pModuleId 
     * @param {Pointer<UInt32>} pTypeDefToken 
     * @returns {HRESULT} 
     */
    GetClassIDInfo(classId, pModuleId, pTypeDefToken) {
        result := ComCall(14, this, "ptr", classId, "ptr*", pModuleId, "uint*", pTypeDefToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Pointer<UIntPtr>} pClassId 
     * @param {Pointer<UIntPtr>} pModuleId 
     * @param {Pointer<UInt32>} pToken 
     * @returns {HRESULT} 
     */
    GetFunctionInfo(functionId, pClassId, pModuleId, pToken) {
        result := ComCall(15, this, "ptr", functionId, "ptr*", pClassId, "ptr*", pModuleId, "uint*", pToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwEvents 
     * @returns {HRESULT} 
     */
    SetEventMask(dwEvents) {
        result := ComCall(16, this, "uint", dwEvents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FunctionEnter>} pFuncEnter 
     * @param {Pointer<FunctionLeave>} pFuncLeave 
     * @param {Pointer<FunctionTailcall>} pFuncTailcall 
     * @returns {HRESULT} 
     */
    SetEnterLeaveFunctionHooks(pFuncEnter, pFuncLeave, pFuncTailcall) {
        result := ComCall(17, this, "ptr", pFuncEnter, "ptr", pFuncLeave, "ptr", pFuncTailcall, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FunctionIDMapper>} pFunc 
     * @returns {HRESULT} 
     */
    SetFunctionIDMapper(pFunc) {
        result := ComCall(18, this, "ptr", pFunc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppImport 
     * @param {Pointer<UInt32>} pToken 
     * @returns {HRESULT} 
     */
    GetTokenAndMetaDataFromFunction(functionId, riid, ppImport, pToken) {
        result := ComCall(19, this, "ptr", functionId, "ptr", riid, "ptr", ppImport, "uint*", pToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {Pointer<Byte>} ppBaseLoadAddress 
     * @param {Integer} cchName 
     * @param {Pointer<UInt32>} pcchName 
     * @param {PWSTR} szName 
     * @param {Pointer<UIntPtr>} pAssemblyId 
     * @returns {HRESULT} 
     */
    GetModuleInfo(moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(20, this, "ptr", moduleId, "char*", ppBaseLoadAddress, "uint", cchName, "uint*", pcchName, "ptr", szName, "ptr*", pAssemblyId, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(21, this, "ptr", moduleId, "uint", dwOpenFlags, "ptr", riid, "ptr", ppOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {Integer} methodId 
     * @param {Pointer<Byte>} ppMethodHeader 
     * @param {Pointer<UInt32>} pcbMethodSize 
     * @returns {HRESULT} 
     */
    GetILFunctionBody(moduleId, methodId, ppMethodHeader, pcbMethodSize) {
        result := ComCall(22, this, "ptr", moduleId, "uint", methodId, "char*", ppMethodHeader, "uint*", pcbMethodSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {Pointer<IMethodMalloc>} ppMalloc 
     * @returns {HRESULT} 
     */
    GetILFunctionBodyAllocator(moduleId, ppMalloc) {
        result := ComCall(23, this, "ptr", moduleId, "ptr", ppMalloc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {Integer} methodid 
     * @param {Pointer<Byte>} pbNewILMethodHeader 
     * @returns {HRESULT} 
     */
    SetILFunctionBody(moduleId, methodid, pbNewILMethodHeader) {
        result := ComCall(24, this, "ptr", moduleId, "uint", methodid, "char*", pbNewILMethodHeader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} appDomainId 
     * @param {Integer} cchName 
     * @param {Pointer<UInt32>} pcchName 
     * @param {PWSTR} szName 
     * @param {Pointer<UIntPtr>} pProcessId 
     * @returns {HRESULT} 
     */
    GetAppDomainInfo(appDomainId, cchName, pcchName, szName, pProcessId) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(25, this, "ptr", appDomainId, "uint", cchName, "uint*", pcchName, "ptr", szName, "ptr*", pProcessId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} assemblyId 
     * @param {Integer} cchName 
     * @param {Pointer<UInt32>} pcchName 
     * @param {PWSTR} szName 
     * @param {Pointer<UIntPtr>} pAppDomainId 
     * @param {Pointer<UIntPtr>} pModuleId 
     * @returns {HRESULT} 
     */
    GetAssemblyInfo(assemblyId, cchName, pcchName, szName, pAppDomainId, pModuleId) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(26, this, "ptr", assemblyId, "uint", cchName, "uint*", pcchName, "ptr", szName, "ptr*", pAppDomainId, "ptr*", pModuleId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @returns {HRESULT} 
     */
    SetFunctionReJIT(functionId) {
        result := ComCall(27, this, "ptr", functionId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ForceGC() {
        result := ComCall(28, this, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(29, this, "ptr", functionId, "int", fStartJit, "uint", cILMapEntries, "ptr", rgILMapEntries, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppicd 
     * @returns {HRESULT} 
     */
    GetInprocInspectionInterface(ppicd) {
        result := ComCall(30, this, "ptr", ppicd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppicd 
     * @returns {HRESULT} 
     */
    GetInprocInspectionIThisThread(ppicd) {
        result := ComCall(31, this, "ptr", ppicd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the context of the specified thread.
     * @param {Pointer} threadId 
     * @param {Pointer<UIntPtr>} pContextId 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getthreadcontext
     */
    GetThreadContext(threadId, pContextId) {
        result := ComCall(32, this, "ptr", threadId, "ptr*", pContextId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fThisThreadOnly 
     * @param {Pointer<UInt32>} pdwProfilerContext 
     * @returns {HRESULT} 
     */
    BeginInprocDebugging(fThisThreadOnly, pdwProfilerContext) {
        result := ComCall(33, this, "int", fThisThreadOnly, "uint*", pdwProfilerContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwProfilerContext 
     * @returns {HRESULT} 
     */
    EndInprocDebugging(dwProfilerContext) {
        result := ComCall(34, this, "uint", dwProfilerContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Integer} cMap 
     * @param {Pointer<UInt32>} pcMap 
     * @param {Pointer<COR_DEBUG_IL_TO_NATIVE_MAP>} map 
     * @returns {HRESULT} 
     */
    GetILToNativeMapping(functionId, cMap, pcMap, map) {
        result := ComCall(35, this, "ptr", functionId, "uint", cMap, "uint*", pcMap, "ptr", map, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
