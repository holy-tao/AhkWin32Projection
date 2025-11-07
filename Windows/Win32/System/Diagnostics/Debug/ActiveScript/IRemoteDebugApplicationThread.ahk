#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IRemoteDebugApplication.ahk
#Include .\IEnumDebugStackFrames.ahk
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
     * @returns {Integer} 
     */
    GetSystemThreadId() {
        result := ComCall(3, this, "uint*", &dwThreadId := 0, "HRESULT")
        return dwThreadId
    }

    /**
     * 
     * @returns {IRemoteDebugApplication} 
     */
    GetApplication() {
        result := ComCall(4, this, "ptr*", &pprda := 0, "HRESULT")
        return IRemoteDebugApplication(pprda)
    }

    /**
     * 
     * @returns {IEnumDebugStackFrames} 
     */
    EnumStackFrames() {
        result := ComCall(5, this, "ptr*", &ppedsf := 0, "HRESULT")
        return IEnumDebugStackFrames(ppedsf)
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
     * @returns {Integer} 
     */
    GetState() {
        result := ComCall(8, this, "uint*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * 
     * @returns {Integer} 
     */
    Suspend() {
        result := ComCall(9, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * 
     * @returns {Integer} 
     */
    Resume() {
        result := ComCall(10, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSuspendCount() {
        result := ComCall(11, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }
}
