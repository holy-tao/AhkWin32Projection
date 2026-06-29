#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\COR_IL_MAP.ahk" { COR_IL_MAP }
#Import ".\IMethodMalloc.ahk" { IMethodMalloc }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\WinRT\Metadata\CorElementType.ahk" { CorElementType }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\COR_DEBUG_IL_TO_NATIVE_MAP.ahk" { COR_DEBUG_IL_TO_NATIVE_MAP }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct ICorProfilerInfo extends IUnknown {
    /**
     * The interface identifier for ICorProfilerInfo
     * @type {Guid}
     */
    static IID := Guid("{28b5557d-3f3f-48b4-90b2-5f9eea2f6c48}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorProfilerInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetClassFromObject              : IntPtr
        GetClassFromToken               : IntPtr
        GetCodeInfo                     : IntPtr
        GetEventMask                    : IntPtr
        GetFunctionFromIP               : IntPtr
        GetFunctionFromToken            : IntPtr
        GetHandleFromThread             : IntPtr
        GetObjectSize                   : IntPtr
        IsArrayClass                    : IntPtr
        GetThreadInfo                   : IntPtr
        GetCurrentThreadID              : IntPtr
        GetClassIDInfo                  : IntPtr
        GetFunctionInfo                 : IntPtr
        SetEventMask                    : IntPtr
        SetEnterLeaveFunctionHooks      : IntPtr
        SetFunctionIDMapper             : IntPtr
        GetTokenAndMetaDataFromFunction : IntPtr
        GetModuleInfo                   : IntPtr
        GetModuleMetaData               : IntPtr
        GetILFunctionBody               : IntPtr
        GetILFunctionBodyAllocator      : IntPtr
        SetILFunctionBody               : IntPtr
        GetAppDomainInfo                : IntPtr
        GetAssemblyInfo                 : IntPtr
        SetFunctionReJIT                : IntPtr
        ForceGC                         : IntPtr
        SetILInstrumentedCodeMap        : IntPtr
        GetInprocInspectionInterface    : IntPtr
        GetInprocInspectionIThisThread  : IntPtr
        GetThreadContext                : IntPtr
        BeginInprocDebugging            : IntPtr
        EndInprocDebugging              : IntPtr
        GetILToNativeMapping            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorProfilerInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} _objectId 
     * @returns {Pointer} 
     */
    GetClassFromObject(_objectId) {
        result := ComCall(3, this, "ptr", _objectId, "ptr*", &pClassId := 0, "HRESULT")
        return pClassId
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {Integer} typeDef 
     * @returns {Pointer} 
     */
    GetClassFromToken(moduleId, typeDef) {
        result := ComCall(4, this, "ptr", moduleId, "uint", typeDef, "ptr*", &pClassId := 0, "HRESULT")
        return pClassId
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Pointer<Pointer<Integer>>} pStart 
     * @param {Pointer<Integer>} pcSize 
     * @returns {HRESULT} 
     */
    GetCodeInfo(functionId, pStart, pcSize) {
        pStartMarshal := pStart is VarRef ? "ptr*" : "ptr"
        pcSizeMarshal := pcSize is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", functionId, pStartMarshal, pStart, pcSizeMarshal, pcSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetEventMask() {
        result := ComCall(6, this, "uint*", &pdwEvents := 0, "HRESULT")
        return pdwEvents
    }

    /**
     * 
     * @param {Pointer<Integer>} ip 
     * @returns {Pointer} 
     */
    GetFunctionFromIP(ip) {
        ipMarshal := ip is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, ipMarshal, ip, "ptr*", &pFunctionId := 0, "HRESULT")
        return pFunctionId
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {Integer} token 
     * @returns {Pointer} 
     */
    GetFunctionFromToken(moduleId, token) {
        result := ComCall(8, this, "ptr", moduleId, "uint", token, "ptr*", &pFunctionId := 0, "HRESULT")
        return pFunctionId
    }

    /**
     * 
     * @param {Pointer} threadId 
     * @returns {HANDLE} 
     */
    GetHandleFromThread(threadId) {
        phThread := HANDLE.Owned()
        result := ComCall(9, this, "ptr", threadId, HANDLE.Ptr, phThread, "HRESULT")
        return phThread
    }

    /**
     * 
     * @param {Pointer} _objectId 
     * @returns {Integer} 
     */
    GetObjectSize(_objectId) {
        result := ComCall(10, this, "ptr", _objectId, "uint*", &pcSize := 0, "HRESULT")
        return pcSize
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Pointer<CorElementType>} pBaseElemType 
     * @param {Pointer<Pointer>} pBaseClassId 
     * @param {Pointer<Integer>} pcRank 
     * @returns {HRESULT} 
     */
    IsArrayClass(classId, pBaseElemType, pBaseClassId, pcRank) {
        pBaseElemTypeMarshal := pBaseElemType is VarRef ? "ptr*" : "ptr"
        pBaseClassIdMarshal := pBaseClassId is VarRef ? "ptr*" : "ptr"
        pcRankMarshal := pcRank is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "ptr", classId, pBaseElemTypeMarshal, pBaseElemType, pBaseClassIdMarshal, pBaseClassId, pcRankMarshal, pcRank, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} threadId 
     * @returns {Integer} 
     */
    GetThreadInfo(threadId) {
        result := ComCall(12, this, "ptr", threadId, "uint*", &pdwWin32ThreadId := 0, "HRESULT")
        return pdwWin32ThreadId
    }

    /**
     * 
     * @returns {Pointer} 
     */
    GetCurrentThreadID() {
        result := ComCall(13, this, "ptr*", &pThreadId := 0, "HRESULT")
        return pThreadId
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Pointer<Pointer>} pModuleId 
     * @param {Pointer<Integer>} pTypeDefToken 
     * @returns {HRESULT} 
     */
    GetClassIDInfo(classId, pModuleId, pTypeDefToken) {
        pModuleIdMarshal := pModuleId is VarRef ? "ptr*" : "ptr"
        pTypeDefTokenMarshal := pTypeDefToken is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr", classId, pModuleIdMarshal, pModuleId, pTypeDefTokenMarshal, pTypeDefToken, "HRESULT")
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
        pClassIdMarshal := pClassId is VarRef ? "ptr*" : "ptr"
        pModuleIdMarshal := pModuleId is VarRef ? "ptr*" : "ptr"
        pTokenMarshal := pToken is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "ptr", functionId, pClassIdMarshal, pClassId, pModuleIdMarshal, pModuleId, pTokenMarshal, pToken, "HRESULT")
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
        pFuncEnterMarshal := pFuncEnter is VarRef ? "ptr*" : "ptr"
        pFuncLeaveMarshal := pFuncLeave is VarRef ? "ptr*" : "ptr"
        pFuncTailcallMarshal := pFuncTailcall is VarRef ? "ptr*" : "ptr"

        result := ComCall(17, this, pFuncEnterMarshal, pFuncEnter, pFuncLeaveMarshal, pFuncLeave, pFuncTailcallMarshal, pFuncTailcall, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<FunctionIDMapper>>} pFunc 
     * @returns {HRESULT} 
     */
    SetFunctionIDMapper(pFunc) {
        pFuncMarshal := pFunc is VarRef ? "ptr*" : "ptr"

        result := ComCall(18, this, pFuncMarshal, pFunc, "HRESULT")
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
        pTokenMarshal := pToken is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, "ptr", functionId, Guid.Ptr, riid, IUnknown.Ptr, ppImport, pTokenMarshal, pToken, "HRESULT")
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

        ppBaseLoadAddressMarshal := ppBaseLoadAddress is VarRef ? "ptr*" : "ptr"
        pcchNameMarshal := pcchName is VarRef ? "uint*" : "ptr"
        pAssemblyIdMarshal := pAssemblyId is VarRef ? "ptr*" : "ptr"

        result := ComCall(20, this, "ptr", moduleId, ppBaseLoadAddressMarshal, ppBaseLoadAddress, "uint", cchName, pcchNameMarshal, pcchName, "ptr", szName, pAssemblyIdMarshal, pAssemblyId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {Integer} dwOpenFlags 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    GetModuleMetaData(moduleId, dwOpenFlags, riid) {
        result := ComCall(21, this, "ptr", moduleId, "uint", dwOpenFlags, Guid.Ptr, riid, "ptr*", &ppOut := 0, "HRESULT")
        return IUnknown(ppOut)
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
        ppMethodHeaderMarshal := ppMethodHeader is VarRef ? "ptr*" : "ptr"
        pcbMethodSizeMarshal := pcbMethodSize is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, "ptr", moduleId, "uint", methodId, ppMethodHeaderMarshal, ppMethodHeader, pcbMethodSizeMarshal, pcbMethodSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @returns {IMethodMalloc} 
     */
    GetILFunctionBodyAllocator(moduleId) {
        result := ComCall(23, this, "ptr", moduleId, "ptr*", &ppMalloc := 0, "HRESULT")
        return IMethodMalloc(ppMalloc)
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {Integer} methodid 
     * @param {Pointer<Integer>} pbNewILMethodHeader 
     * @returns {HRESULT} 
     */
    SetILFunctionBody(moduleId, methodid, pbNewILMethodHeader) {
        pbNewILMethodHeaderMarshal := pbNewILMethodHeader is VarRef ? "char*" : "ptr"

        result := ComCall(24, this, "ptr", moduleId, "uint", methodid, pbNewILMethodHeaderMarshal, pbNewILMethodHeader, "HRESULT")
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

        pcchNameMarshal := pcchName is VarRef ? "uint*" : "ptr"
        pProcessIdMarshal := pProcessId is VarRef ? "ptr*" : "ptr"

        result := ComCall(25, this, "ptr", appDomainId, "uint", cchName, pcchNameMarshal, pcchName, "ptr", szName, pProcessIdMarshal, pProcessId, "HRESULT")
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

        pcchNameMarshal := pcchName is VarRef ? "uint*" : "ptr"
        pAppDomainIdMarshal := pAppDomainId is VarRef ? "ptr*" : "ptr"
        pModuleIdMarshal := pModuleId is VarRef ? "ptr*" : "ptr"

        result := ComCall(26, this, "ptr", assemblyId, "uint", cchName, pcchNameMarshal, pcchName, "ptr", szName, pAppDomainIdMarshal, pAppDomainId, pModuleIdMarshal, pModuleId, "HRESULT")
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
        result := ComCall(29, this, "ptr", functionId, BOOL, fStartJit, "uint", cILMapEntries, COR_IL_MAP.Ptr, rgILMapEntries, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    GetInprocInspectionInterface() {
        result := ComCall(30, this, "ptr*", &ppicd := 0, "HRESULT")
        return IUnknown(ppicd)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    GetInprocInspectionIThisThread() {
        result := ComCall(31, this, "ptr*", &ppicd := 0, "HRESULT")
        return IUnknown(ppicd)
    }

    /**
     * Retrieves the context of the specified thread.
     * @remarks
     * This function is used to retrieve the thread context of the specified thread. The function retrieves a selective context based on the value of the **ContextFlags** member of the context structure. The thread identified by the *hThread* parameter is typically being debugged, but the function can also operate when the thread is not being debugged.
     * 
     * You cannot get a valid context for a running thread. Use the [SuspendThread](/windows/desktop/api/processthreadsapi/nf-processthreadsapi-suspendthread) function to suspend the thread before calling **GetThreadContext**.
     * 
     * If you call **GetThreadContext** for the current thread, the function returns successfully; however, the context returned is not valid.
     * @param {Pointer} threadId 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getthreadcontext
     */
    GetThreadContext(threadId) {
        result := ComCall(32, this, "ptr", threadId, "ptr*", &pContextId := 0, "HRESULT")
        return pContextId
    }

    /**
     * 
     * @param {BOOL} fThisThreadOnly 
     * @returns {Integer} 
     */
    BeginInprocDebugging(fThisThreadOnly) {
        result := ComCall(33, this, BOOL, fThisThreadOnly, "uint*", &pdwProfilerContext := 0, "HRESULT")
        return pdwProfilerContext
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
     * @param {Pointer<COR_DEBUG_IL_TO_NATIVE_MAP>} _map 
     * @returns {HRESULT} 
     */
    GetILToNativeMapping(functionId, cMap, pcMap, _map) {
        pcMapMarshal := pcMap is VarRef ? "uint*" : "ptr"

        result := ComCall(35, this, "ptr", functionId, "uint", cMap, pcMapMarshal, pcMap, COR_DEBUG_IL_TO_NATIVE_MAP.Ptr, _map, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICorProfilerInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetClassFromObject := CallbackCreate(GetMethod(implObj, "GetClassFromObject"), flags, 3)
        this.vtbl.GetClassFromToken := CallbackCreate(GetMethod(implObj, "GetClassFromToken"), flags, 4)
        this.vtbl.GetCodeInfo := CallbackCreate(GetMethod(implObj, "GetCodeInfo"), flags, 4)
        this.vtbl.GetEventMask := CallbackCreate(GetMethod(implObj, "GetEventMask"), flags, 2)
        this.vtbl.GetFunctionFromIP := CallbackCreate(GetMethod(implObj, "GetFunctionFromIP"), flags, 3)
        this.vtbl.GetFunctionFromToken := CallbackCreate(GetMethod(implObj, "GetFunctionFromToken"), flags, 4)
        this.vtbl.GetHandleFromThread := CallbackCreate(GetMethod(implObj, "GetHandleFromThread"), flags, 3)
        this.vtbl.GetObjectSize := CallbackCreate(GetMethod(implObj, "GetObjectSize"), flags, 3)
        this.vtbl.IsArrayClass := CallbackCreate(GetMethod(implObj, "IsArrayClass"), flags, 5)
        this.vtbl.GetThreadInfo := CallbackCreate(GetMethod(implObj, "GetThreadInfo"), flags, 3)
        this.vtbl.GetCurrentThreadID := CallbackCreate(GetMethod(implObj, "GetCurrentThreadID"), flags, 2)
        this.vtbl.GetClassIDInfo := CallbackCreate(GetMethod(implObj, "GetClassIDInfo"), flags, 4)
        this.vtbl.GetFunctionInfo := CallbackCreate(GetMethod(implObj, "GetFunctionInfo"), flags, 5)
        this.vtbl.SetEventMask := CallbackCreate(GetMethod(implObj, "SetEventMask"), flags, 2)
        this.vtbl.SetEnterLeaveFunctionHooks := CallbackCreate(GetMethod(implObj, "SetEnterLeaveFunctionHooks"), flags, 4)
        this.vtbl.SetFunctionIDMapper := CallbackCreate(GetMethod(implObj, "SetFunctionIDMapper"), flags, 2)
        this.vtbl.GetTokenAndMetaDataFromFunction := CallbackCreate(GetMethod(implObj, "GetTokenAndMetaDataFromFunction"), flags, 5)
        this.vtbl.GetModuleInfo := CallbackCreate(GetMethod(implObj, "GetModuleInfo"), flags, 7)
        this.vtbl.GetModuleMetaData := CallbackCreate(GetMethod(implObj, "GetModuleMetaData"), flags, 5)
        this.vtbl.GetILFunctionBody := CallbackCreate(GetMethod(implObj, "GetILFunctionBody"), flags, 5)
        this.vtbl.GetILFunctionBodyAllocator := CallbackCreate(GetMethod(implObj, "GetILFunctionBodyAllocator"), flags, 3)
        this.vtbl.SetILFunctionBody := CallbackCreate(GetMethod(implObj, "SetILFunctionBody"), flags, 4)
        this.vtbl.GetAppDomainInfo := CallbackCreate(GetMethod(implObj, "GetAppDomainInfo"), flags, 6)
        this.vtbl.GetAssemblyInfo := CallbackCreate(GetMethod(implObj, "GetAssemblyInfo"), flags, 7)
        this.vtbl.SetFunctionReJIT := CallbackCreate(GetMethod(implObj, "SetFunctionReJIT"), flags, 2)
        this.vtbl.ForceGC := CallbackCreate(GetMethod(implObj, "ForceGC"), flags, 1)
        this.vtbl.SetILInstrumentedCodeMap := CallbackCreate(GetMethod(implObj, "SetILInstrumentedCodeMap"), flags, 5)
        this.vtbl.GetInprocInspectionInterface := CallbackCreate(GetMethod(implObj, "GetInprocInspectionInterface"), flags, 2)
        this.vtbl.GetInprocInspectionIThisThread := CallbackCreate(GetMethod(implObj, "GetInprocInspectionIThisThread"), flags, 2)
        this.vtbl.GetThreadContext := CallbackCreate(GetMethod(implObj, "GetThreadContext"), flags, 3)
        this.vtbl.BeginInprocDebugging := CallbackCreate(GetMethod(implObj, "BeginInprocDebugging"), flags, 3)
        this.vtbl.EndInprocDebugging := CallbackCreate(GetMethod(implObj, "EndInprocDebugging"), flags, 2)
        this.vtbl.GetILToNativeMapping := CallbackCreate(GetMethod(implObj, "GetILToNativeMapping"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetClassFromObject)
        CallbackFree(this.vtbl.GetClassFromToken)
        CallbackFree(this.vtbl.GetCodeInfo)
        CallbackFree(this.vtbl.GetEventMask)
        CallbackFree(this.vtbl.GetFunctionFromIP)
        CallbackFree(this.vtbl.GetFunctionFromToken)
        CallbackFree(this.vtbl.GetHandleFromThread)
        CallbackFree(this.vtbl.GetObjectSize)
        CallbackFree(this.vtbl.IsArrayClass)
        CallbackFree(this.vtbl.GetThreadInfo)
        CallbackFree(this.vtbl.GetCurrentThreadID)
        CallbackFree(this.vtbl.GetClassIDInfo)
        CallbackFree(this.vtbl.GetFunctionInfo)
        CallbackFree(this.vtbl.SetEventMask)
        CallbackFree(this.vtbl.SetEnterLeaveFunctionHooks)
        CallbackFree(this.vtbl.SetFunctionIDMapper)
        CallbackFree(this.vtbl.GetTokenAndMetaDataFromFunction)
        CallbackFree(this.vtbl.GetModuleInfo)
        CallbackFree(this.vtbl.GetModuleMetaData)
        CallbackFree(this.vtbl.GetILFunctionBody)
        CallbackFree(this.vtbl.GetILFunctionBodyAllocator)
        CallbackFree(this.vtbl.SetILFunctionBody)
        CallbackFree(this.vtbl.GetAppDomainInfo)
        CallbackFree(this.vtbl.GetAssemblyInfo)
        CallbackFree(this.vtbl.SetFunctionReJIT)
        CallbackFree(this.vtbl.ForceGC)
        CallbackFree(this.vtbl.SetILInstrumentedCodeMap)
        CallbackFree(this.vtbl.GetInprocInspectionInterface)
        CallbackFree(this.vtbl.GetInprocInspectionIThisThread)
        CallbackFree(this.vtbl.GetThreadContext)
        CallbackFree(this.vtbl.BeginInprocDebugging)
        CallbackFree(this.vtbl.EndInprocDebugging)
        CallbackFree(this.vtbl.GetILToNativeMapping)
    }
}
