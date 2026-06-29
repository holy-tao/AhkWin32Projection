#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugAsyncOperation.ahk" { IDebugAsyncOperation }
#Import ".\IRemoteDebugApplicationThread.ahk" { IRemoteDebugApplicationThread }
#Import ".\IDebugThreadCall32.ahk" { IDebugThreadCall32 }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IProvideExpressionContexts.ahk" { IProvideExpressionContexts }
#Import ".\BREAKRESUMEACTION.ahk" { BREAKRESUMEACTION }
#Import ".\IDebugApplicationThread.ahk" { IDebugApplicationThread }
#Import ".\IDebugStackFrameSniffer.ahk" { IDebugStackFrameSniffer }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ERRORRESUMEACTION.ahk" { ERRORRESUMEACTION }
#Import ".\IDebugApplicationNode.ahk" { IDebugApplicationNode }
#Import ".\IRemoteDebugApplication.ahk" { IRemoteDebugApplication }
#Import "..\..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IActiveScriptSite.ahk" { IActiveScriptSite }
#Import ".\BREAKREASON.ahk" { BREAKREASON }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDebugSyncOperation.ahk" { IDebugSyncOperation }
#Import ".\IActiveScriptErrorDebug.ahk" { IActiveScriptErrorDebug }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugApplication32 extends IRemoteDebugApplication {
    /**
     * The interface identifier for IDebugApplication32
     * @type {Guid}
     */
    static IID := Guid("{51973c32-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugApplication32 interfaces
    */
    struct Vtbl extends IRemoteDebugApplication.Vtbl {
        SetName                               : IntPtr
        StepOutComplete                       : IntPtr
        DebugOutput                           : IntPtr
        StartDebugSession                     : IntPtr
        HandleBreakPoint                      : IntPtr
        Close                                 : IntPtr
        GetBreakFlags                         : IntPtr
        GetCurrentThread                      : IntPtr
        CreateAsyncDebugOperation             : IntPtr
        AddStackFrameSniffer                  : IntPtr
        RemoveStackFrameSniffer               : IntPtr
        QueryCurrentThreadIsDebuggerThread    : IntPtr
        SynchronousCallInDebuggerThread       : IntPtr
        CreateApplicationNode                 : IntPtr
        FireDebuggerEvent                     : IntPtr
        HandleRuntimeError                    : IntPtr
        FCanJitDebug                          : IntPtr
        FIsAutoJitDebugEnabled                : IntPtr
        AddGlobalExpressionContextProvider    : IntPtr
        RemoveGlobalExpressionContextProvider : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugApplication32.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pstrName 
     * @returns {HRESULT} 
     */
    SetName(pstrName) {
        pstrName := pstrName is String ? StrPtr(pstrName) : pstrName

        result := ComCall(14, this, "ptr", pstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StepOutComplete() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} _pstr 
     * @returns {HRESULT} 
     */
    DebugOutput(_pstr) {
        _pstr := _pstr is String ? StrPtr(_pstr) : _pstr

        result := ComCall(16, this, "ptr", _pstr, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StartDebugSession() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BREAKREASON} br 
     * @returns {BREAKRESUMEACTION} 
     */
    HandleBreakPoint(br) {
        result := ComCall(18, this, BREAKREASON, br, "int*", &pbra := 0, "HRESULT")
        return pbra
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pabf 
     * @param {Pointer<IRemoteDebugApplicationThread>} pprdatSteppingThread 
     * @returns {HRESULT} 
     */
    GetBreakFlags(pabf, pprdatSteppingThread) {
        pabfMarshal := pabf is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, pabfMarshal, pabf, IRemoteDebugApplicationThread.Ptr, pprdatSteppingThread, "HRESULT")
        return result
    }

    /**
     * Retrieves a pseudo handle for the calling thread.
     * @remarks
     * A pseudo handle is a special constant that is interpreted as the current thread handle. The calling thread can use this handle to specify itself whenever a thread handle is required. Pseudo handles are not inherited by child processes.
     * 
     * This handle has the <b>THREAD_ALL_ACCESS</b> access right to the thread object. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This handle has the maximum access allowed by the security descriptor of the thread to the primary token of the process.
     * 
     * The function cannot be used by one thread to create a handle that can be used by other threads to refer to the first thread. The handle is always interpreted as referring to the thread that is using it. A thread can create a "real" handle to itself that can be used by other threads, or inherited by other processes, by specifying the pseudo handle as the source handle in a call to the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-duplicatehandle">DuplicateHandle</a> function.
     * 
     * The pseudo handle need not be closed when it is no longer needed. Calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function with this handle has no effect. If the pseudo handle is duplicated by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-duplicatehandle">DuplicateHandle</a>, the duplicate handle must be closed.
     * 
     * Do not create a thread while impersonating a security context. The call will succeed, however the newly created thread will have reduced access rights to itself when calling <b>GetCurrentThread</b>. The access rights granted this thread will  be derived from the access rights the impersonated user has to the process.  Some access rights including <b>THREAD_SET_THREAD_TOKEN</b> and <b>THREAD_GET_CONTEXT</b> may not be present, leading to unexpected failures.
     * @returns {IDebugApplicationThread} 
     * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getcurrentthread
     */
    GetCurrentThread() {
        result := ComCall(21, this, "ptr*", &pat := 0, "HRESULT")
        return IDebugApplicationThread(pat)
    }

    /**
     * 
     * @param {IDebugSyncOperation} psdo 
     * @returns {IDebugAsyncOperation} 
     */
    CreateAsyncDebugOperation(psdo) {
        result := ComCall(22, this, "ptr", psdo, "ptr*", &ppado := 0, "HRESULT")
        return IDebugAsyncOperation(ppado)
    }

    /**
     * 
     * @param {IDebugStackFrameSniffer} pdsfs 
     * @returns {Integer} 
     */
    AddStackFrameSniffer(pdsfs) {
        result := ComCall(23, this, "ptr", pdsfs, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    RemoveStackFrameSniffer(dwCookie) {
        result := ComCall(24, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    QueryCurrentThreadIsDebuggerThread() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugThreadCall32} pptc 
     * @param {Integer} dwParam1 
     * @param {Integer} dwParam2 
     * @param {Integer} dwParam3 
     * @returns {HRESULT} 
     */
    SynchronousCallInDebuggerThread(pptc, dwParam1, dwParam2, dwParam3) {
        result := ComCall(26, this, "ptr", pptc, "uint", dwParam1, "uint", dwParam2, "uint", dwParam3, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDebugApplicationNode} 
     */
    CreateApplicationNode() {
        result := ComCall(27, this, "ptr*", &ppdanNew := 0, "HRESULT")
        return IDebugApplicationNode(ppdanNew)
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     */
    FireDebuggerEvent(riid, punk) {
        result := ComCall(28, this, Guid.Ptr, riid, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IActiveScriptErrorDebug} pErrorDebug 
     * @param {IActiveScriptSite} pScriptSite 
     * @param {Pointer<BREAKRESUMEACTION>} pbra 
     * @param {Pointer<ERRORRESUMEACTION>} perra 
     * @param {Pointer<BOOL>} pfCallOnScriptError 
     * @returns {HRESULT} 
     */
    HandleRuntimeError(pErrorDebug, pScriptSite, pbra, perra, pfCallOnScriptError) {
        pbraMarshal := pbra is VarRef ? "int*" : "ptr"
        perraMarshal := perra is VarRef ? "int*" : "ptr"
        pfCallOnScriptErrorMarshal := pfCallOnScriptError is VarRef ? "int*" : "ptr"

        result := ComCall(29, this, "ptr", pErrorDebug, "ptr", pScriptSite, pbraMarshal, pbra, perraMarshal, perra, pfCallOnScriptErrorMarshal, pfCallOnScriptError, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    FCanJitDebug() {
        result := ComCall(30, this, BOOL)
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    FIsAutoJitDebugEnabled() {
        result := ComCall(31, this, BOOL)
        return result
    }

    /**
     * 
     * @param {IProvideExpressionContexts} pdsfs 
     * @returns {Integer} 
     */
    AddGlobalExpressionContextProvider(pdsfs) {
        result := ComCall(32, this, "ptr", pdsfs, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    RemoveGlobalExpressionContextProvider(dwCookie) {
        result := ComCall(33, this, "uint", dwCookie, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugApplication32.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetName := CallbackCreate(GetMethod(implObj, "SetName"), flags, 2)
        this.vtbl.StepOutComplete := CallbackCreate(GetMethod(implObj, "StepOutComplete"), flags, 1)
        this.vtbl.DebugOutput := CallbackCreate(GetMethod(implObj, "DebugOutput"), flags, 2)
        this.vtbl.StartDebugSession := CallbackCreate(GetMethod(implObj, "StartDebugSession"), flags, 1)
        this.vtbl.HandleBreakPoint := CallbackCreate(GetMethod(implObj, "HandleBreakPoint"), flags, 3)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
        this.vtbl.GetBreakFlags := CallbackCreate(GetMethod(implObj, "GetBreakFlags"), flags, 3)
        this.vtbl.GetCurrentThread := CallbackCreate(GetMethod(implObj, "GetCurrentThread"), flags, 2)
        this.vtbl.CreateAsyncDebugOperation := CallbackCreate(GetMethod(implObj, "CreateAsyncDebugOperation"), flags, 3)
        this.vtbl.AddStackFrameSniffer := CallbackCreate(GetMethod(implObj, "AddStackFrameSniffer"), flags, 3)
        this.vtbl.RemoveStackFrameSniffer := CallbackCreate(GetMethod(implObj, "RemoveStackFrameSniffer"), flags, 2)
        this.vtbl.QueryCurrentThreadIsDebuggerThread := CallbackCreate(GetMethod(implObj, "QueryCurrentThreadIsDebuggerThread"), flags, 1)
        this.vtbl.SynchronousCallInDebuggerThread := CallbackCreate(GetMethod(implObj, "SynchronousCallInDebuggerThread"), flags, 5)
        this.vtbl.CreateApplicationNode := CallbackCreate(GetMethod(implObj, "CreateApplicationNode"), flags, 2)
        this.vtbl.FireDebuggerEvent := CallbackCreate(GetMethod(implObj, "FireDebuggerEvent"), flags, 3)
        this.vtbl.HandleRuntimeError := CallbackCreate(GetMethod(implObj, "HandleRuntimeError"), flags, 6)
        this.vtbl.FCanJitDebug := CallbackCreate(GetMethod(implObj, "FCanJitDebug"), flags, 1)
        this.vtbl.FIsAutoJitDebugEnabled := CallbackCreate(GetMethod(implObj, "FIsAutoJitDebugEnabled"), flags, 1)
        this.vtbl.AddGlobalExpressionContextProvider := CallbackCreate(GetMethod(implObj, "AddGlobalExpressionContextProvider"), flags, 3)
        this.vtbl.RemoveGlobalExpressionContextProvider := CallbackCreate(GetMethod(implObj, "RemoveGlobalExpressionContextProvider"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetName)
        CallbackFree(this.vtbl.StepOutComplete)
        CallbackFree(this.vtbl.DebugOutput)
        CallbackFree(this.vtbl.StartDebugSession)
        CallbackFree(this.vtbl.HandleBreakPoint)
        CallbackFree(this.vtbl.Close)
        CallbackFree(this.vtbl.GetBreakFlags)
        CallbackFree(this.vtbl.GetCurrentThread)
        CallbackFree(this.vtbl.CreateAsyncDebugOperation)
        CallbackFree(this.vtbl.AddStackFrameSniffer)
        CallbackFree(this.vtbl.RemoveStackFrameSniffer)
        CallbackFree(this.vtbl.QueryCurrentThreadIsDebuggerThread)
        CallbackFree(this.vtbl.SynchronousCallInDebuggerThread)
        CallbackFree(this.vtbl.CreateApplicationNode)
        CallbackFree(this.vtbl.FireDebuggerEvent)
        CallbackFree(this.vtbl.HandleRuntimeError)
        CallbackFree(this.vtbl.FCanJitDebug)
        CallbackFree(this.vtbl.FIsAutoJitDebugEnabled)
        CallbackFree(this.vtbl.AddGlobalExpressionContextProvider)
        CallbackFree(this.vtbl.RemoveGlobalExpressionContextProvider)
    }
}
