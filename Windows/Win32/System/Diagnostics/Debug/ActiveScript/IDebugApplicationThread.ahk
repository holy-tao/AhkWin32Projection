#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IRemoteDebugApplicationThread.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugApplicationThread extends IRemoteDebugApplicationThread{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugApplicationThread
     * @type {Guid}
     */
    static IID => Guid("{51973c38-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SynchronousCallIntoThread32", "QueryIsCurrentThread", "QueryIsDebuggerThread", "SetDescription", "SetStateString"]

    /**
     * 
     * @param {IDebugThreadCall32} pstcb 
     * @param {Integer} dwParam1 
     * @param {Integer} dwParam2 
     * @param {Integer} dwParam3 
     * @returns {HRESULT} 
     */
    SynchronousCallIntoThread32(pstcb, dwParam1, dwParam2, dwParam3) {
        result := ComCall(12, this, "ptr", pstcb, "uint", dwParam1, "uint", dwParam2, "uint", dwParam3, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    QueryIsCurrentThread() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    QueryIsDebuggerThread() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pstrDescription 
     * @returns {HRESULT} 
     */
    SetDescription(pstrDescription) {
        pstrDescription := pstrDescription is String ? StrPtr(pstrDescription) : pstrDescription

        result := ComCall(15, this, "ptr", pstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pstrState 
     * @returns {HRESULT} 
     */
    SetStateString(pstrState) {
        pstrState := pstrState is String ? StrPtr(pstrState) : pstrState

        result := ComCall(16, this, "ptr", pstrState, "HRESULT")
        return result
    }
}
