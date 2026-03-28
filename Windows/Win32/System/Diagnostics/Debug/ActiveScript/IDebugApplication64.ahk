#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugApplicationThread.ahk
#Include .\IDebugAsyncOperation.ahk
#Include .\IDebugApplicationNode.ahk
#Include .\IRemoteDebugApplication.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugApplication64 extends IRemoteDebugApplication{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugApplication64
     * @type {Guid}
     */
    static IID => Guid("{4dedc754-04c7-4f10-9e60-16a390fe6e62}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetName", "StepOutComplete", "DebugOutput", "StartDebugSession", "HandleBreakPoint", "Close", "GetBreakFlags", "GetCurrentThread", "CreateAsyncDebugOperation", "AddStackFrameSniffer", "RemoveStackFrameSniffer", "QueryCurrentThreadIsDebuggerThread", "SynchronousCallInDebuggerThread", "CreateApplicationNode", "FireDebuggerEvent", "HandleRuntimeError", "FCanJitDebug", "FIsAutoJitDebugEnabled", "AddGlobalExpressionContextProvider", "RemoveGlobalExpressionContextProvider"]

    /**
     * Sets the read mode and the blocking mode of the specified named pipe. If the specified handle is to the client end of a named pipe and if the named pipe server process is on a remote computer, the function can also be used to control local buffering.
     * @remarks
     * <b>Windows 10, version 1709:  </b>Pipes are only supported within an app-container; ie, from one UWP process to another UWP process that's part of the same app. Also, named pipes must use the syntax `\\.\pipe\LOCAL\` for the pipe name.
     * @param {PWSTR} pstrName 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/namedpipeapi/nf-namedpipeapi-setnamedpipehandlestate
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
     * @param {Integer} br 
     * @returns {Integer} 
     */
    HandleBreakPoint(br) {
        result := ComCall(18, this, "int", br, "int*", &pbra := 0, "HRESULT")
        return pbra
    }

    /**
     * Use the Close-Session packet to tell the BITS server that file upload is complete and to end the session.
     * @remarks
     * The BITS server releases all resources and deletes all temporary files when it receives this packet.
     * 
     * For upload-reply jobs, you must download the reply before sending **Close-Session**. Otherwise, the reply is lost.
     * 
     * If you send this packet before uploading all fragments, the upload file is deleted; you cannot upload a partial file.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Bits/close-session
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

        result := ComCall(20, this, pabfMarshal, pabf, "ptr*", pprdatSteppingThread, "HRESULT")
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
     * @param {IDebugThreadCall64} pptc 
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
        result := ComCall(28, this, "ptr", riid, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IActiveScriptErrorDebug} pErrorDebug 
     * @param {IActiveScriptSite} pScriptSite 
     * @param {Pointer<Integer>} pbra 
     * @param {Pointer<Integer>} perra 
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
        result := ComCall(30, this, "int")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    FIsAutoJitDebugEnabled() {
        result := ComCall(31, this, "int")
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
}
