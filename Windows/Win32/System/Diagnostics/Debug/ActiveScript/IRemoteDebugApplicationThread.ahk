#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IRemoteDebugApplicationThread extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteDebugApplicationThread
     * @type {Guid}
     */
    static IID => Guid("{51973c37-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSystemThreadId", "GetApplication", "EnumStackFrames", "GetDescription", "SetNextStatement", "GetState", "Suspend", "Resume", "GetSuspendCount"]

    /**
     * 
     * @param {Pointer<Integer>} dwThreadId 
     * @returns {HRESULT} 
     */
    GetSystemThreadId(dwThreadId) {
        dwThreadIdMarshal := dwThreadId is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, dwThreadIdMarshal, dwThreadId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRemoteDebugApplication>} pprda 
     * @returns {HRESULT} 
     */
    GetApplication(pprda) {
        result := ComCall(4, this, "ptr*", pprda, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumDebugStackFrames>} ppedsf 
     * @returns {HRESULT} 
     */
    EnumStackFrames(ppedsf) {
        result := ComCall(5, this, "ptr*", ppedsf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDescription 
     * @param {Pointer<BSTR>} pbstrState 
     * @returns {HRESULT} 
     */
    GetDescription(pbstrDescription, pbstrState) {
        result := ComCall(6, this, "ptr", pbstrDescription, "ptr", pbstrState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugStackFrame} pStackFrame 
     * @param {IDebugCodeContext} pCodeContext 
     * @returns {HRESULT} 
     */
    SetNextStatement(pStackFrame, pCodeContext) {
        result := ComCall(7, this, "ptr", pStackFrame, "ptr", pCodeContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pState 
     * @returns {HRESULT} 
     */
    GetState(pState) {
        pStateMarshal := pState is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pStateMarshal, pState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwCount 
     * @returns {HRESULT} 
     */
    Suspend(pdwCount) {
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pdwCountMarshal, pdwCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwCount 
     * @returns {HRESULT} 
     */
    Resume(pdwCount) {
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pdwCountMarshal, pdwCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwCount 
     * @returns {HRESULT} 
     */
    GetSuspendCount(pdwCount) {
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, pdwCountMarshal, pdwCount, "HRESULT")
        return result
    }
}
