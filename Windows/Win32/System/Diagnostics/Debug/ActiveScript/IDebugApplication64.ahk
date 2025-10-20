#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IRemoteDebugApplication.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugApplication64 extends IRemoteDebugApplication{
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
     * 
     * @param {PWSTR} pstrName 
     * @returns {HRESULT} 
     */
    SetName(pstrName) {
        pstrName := pstrName is String ? StrPtr(pstrName) : pstrName

        result := ComCall(14, this, "ptr", pstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StepOutComplete() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pstr 
     * @returns {HRESULT} 
     */
    DebugOutput(pstr) {
        pstr := pstr is String ? StrPtr(pstr) : pstr

        result := ComCall(16, this, "ptr", pstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StartDebugSession() {
        result := ComCall(17, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} br 
     * @param {Pointer<Int32>} pbra 
     * @returns {HRESULT} 
     */
    HandleBreakPoint(br, pbra) {
        result := ComCall(18, this, "int", br, "int*", pbra, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(19, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pabf 
     * @param {Pointer<IRemoteDebugApplicationThread>} pprdatSteppingThread 
     * @returns {HRESULT} 
     */
    GetBreakFlags(pabf, pprdatSteppingThread) {
        result := ComCall(20, this, "uint*", pabf, "ptr", pprdatSteppingThread, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a pseudo handle for the calling thread.
     * @param {Pointer<IDebugApplicationThread>} pat 
     * @returns {HRESULT} The return value is a pseudo handle for the current thread.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getcurrentthread
     */
    GetCurrentThread(pat) {
        result := ComCall(21, this, "ptr", pat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugSyncOperation>} psdo 
     * @param {Pointer<IDebugAsyncOperation>} ppado 
     * @returns {HRESULT} 
     */
    CreateAsyncDebugOperation(psdo, ppado) {
        result := ComCall(22, this, "ptr", psdo, "ptr", ppado, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugStackFrameSniffer>} pdsfs 
     * @param {Pointer<UInt32>} pdwCookie 
     * @returns {HRESULT} 
     */
    AddStackFrameSniffer(pdsfs, pdwCookie) {
        result := ComCall(23, this, "ptr", pdsfs, "uint*", pdwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    RemoveStackFrameSniffer(dwCookie) {
        result := ComCall(24, this, "uint", dwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    QueryCurrentThreadIsDebuggerThread() {
        result := ComCall(25, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugThreadCall64>} pptc 
     * @param {Integer} dwParam1 
     * @param {Integer} dwParam2 
     * @param {Integer} dwParam3 
     * @returns {HRESULT} 
     */
    SynchronousCallInDebuggerThread(pptc, dwParam1, dwParam2, dwParam3) {
        result := ComCall(26, this, "ptr", pptc, "uint", dwParam1, "uint", dwParam2, "uint", dwParam3, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugApplicationNode>} ppdanNew 
     * @returns {HRESULT} 
     */
    CreateApplicationNode(ppdanNew) {
        result := ComCall(27, this, "ptr", ppdanNew, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} punk 
     * @returns {HRESULT} 
     */
    FireDebuggerEvent(riid, punk) {
        result := ComCall(28, this, "ptr", riid, "ptr", punk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IActiveScriptErrorDebug>} pErrorDebug 
     * @param {Pointer<IActiveScriptSite>} pScriptSite 
     * @param {Pointer<Int32>} pbra 
     * @param {Pointer<Int32>} perra 
     * @param {Pointer<BOOL>} pfCallOnScriptError 
     * @returns {HRESULT} 
     */
    HandleRuntimeError(pErrorDebug, pScriptSite, pbra, perra, pfCallOnScriptError) {
        result := ComCall(29, this, "ptr", pErrorDebug, "ptr", pScriptSite, "int*", pbra, "int*", perra, "ptr", pfCallOnScriptError, "int")
        if(result != 0)
            throw OSError(result)

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
     * @param {Pointer<IProvideExpressionContexts>} pdsfs 
     * @param {Pointer<UInt64>} pdwCookie 
     * @returns {HRESULT} 
     */
    AddGlobalExpressionContextProvider(pdsfs, pdwCookie) {
        result := ComCall(32, this, "ptr", pdsfs, "uint*", pdwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    RemoveGlobalExpressionContextProvider(dwCookie) {
        result := ComCall(33, this, "uint", dwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
