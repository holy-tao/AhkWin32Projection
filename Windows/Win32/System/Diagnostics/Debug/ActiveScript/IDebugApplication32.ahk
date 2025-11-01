#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IRemoteDebugApplication.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugApplication32 extends IRemoteDebugApplication{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugApplication32
     * @type {Guid}
     */
    static IID => Guid("{51973c32-cb0c-11d0-b5c9-00a0244a0e7a}")

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
     * @param {PWSTR} pstr 
     * @returns {HRESULT} 
     */
    DebugOutput(pstr) {
        pstr := pstr is String ? StrPtr(pstr) : pstr

        result := ComCall(16, this, "ptr", pstr, "HRESULT")
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
     * @param {Pointer<Integer>} pbra 
     * @returns {HRESULT} 
     */
    HandleBreakPoint(br, pbra) {
        pbraMarshal := pbra is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, "int", br, pbraMarshal, pbra, "HRESULT")
        return result
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

        result := ComCall(20, this, pabfMarshal, pabf, "ptr*", pprdatSteppingThread, "HRESULT")
        return result
    }

    /**
     * Retrieves a pseudo handle for the calling thread.
     * @param {Pointer<IDebugApplicationThread>} pat 
     * @returns {HRESULT} The return value is a pseudo handle for the current thread.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getcurrentthread
     */
    GetCurrentThread(pat) {
        result := ComCall(21, this, "ptr*", pat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugSyncOperation} psdo 
     * @param {Pointer<IDebugAsyncOperation>} ppado 
     * @returns {HRESULT} 
     */
    CreateAsyncDebugOperation(psdo, ppado) {
        result := ComCall(22, this, "ptr", psdo, "ptr*", ppado, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugStackFrameSniffer} pdsfs 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {HRESULT} 
     */
    AddStackFrameSniffer(pdsfs, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, "ptr", pdsfs, pdwCookieMarshal, pdwCookie, "HRESULT")
        return result
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
     * @param {Pointer<IDebugApplicationNode>} ppdanNew 
     * @returns {HRESULT} 
     */
    CreateApplicationNode(ppdanNew) {
        result := ComCall(27, this, "ptr*", ppdanNew, "HRESULT")
        return result
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

        result := ComCall(29, this, "ptr", pErrorDebug, "ptr", pScriptSite, pbraMarshal, pbra, perraMarshal, perra, "ptr", pfCallOnScriptError, "HRESULT")
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
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {HRESULT} 
     */
    AddGlobalExpressionContextProvider(pdsfs, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(32, this, "ptr", pdsfs, pdwCookieMarshal, pdwCookie, "HRESULT")
        return result
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
