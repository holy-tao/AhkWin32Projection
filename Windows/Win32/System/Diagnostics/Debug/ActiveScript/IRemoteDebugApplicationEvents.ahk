#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IRemoteDebugApplicationEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteDebugApplicationEvents
     * @type {Guid}
     */
    static IID => Guid("{51973c33-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnConnectDebugger", "OnDisconnectDebugger", "OnSetName", "OnDebugOutput", "OnClose", "OnEnterBreakPoint", "OnLeaveBreakPoint", "OnCreateThread", "OnDestroyThread", "OnBreakFlagChange"]

    /**
     * 
     * @param {IApplicationDebugger} pad 
     * @returns {HRESULT} 
     */
    OnConnectDebugger(pad) {
        result := ComCall(3, this, "ptr", pad, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnDisconnectDebugger() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} pstrName 
     * @returns {HRESULT} 
     */
    OnSetName(pstrName) {
        pstrName := pstrName is String ? StrPtr(pstrName) : pstrName

        result := ComCall(5, this, "ptr", pstrName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} pstr_ 
     * @returns {HRESULT} 
     */
    OnDebugOutput(pstr_) {
        pstr_ := pstr_ is String ? StrPtr(pstr_) : pstr_

        result := ComCall(6, this, "ptr", pstr_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnClose() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IRemoteDebugApplicationThread} prdat 
     * @returns {HRESULT} 
     */
    OnEnterBreakPoint(prdat) {
        result := ComCall(8, this, "ptr", prdat, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IRemoteDebugApplicationThread} prdat 
     * @returns {HRESULT} 
     */
    OnLeaveBreakPoint(prdat) {
        result := ComCall(9, this, "ptr", prdat, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IRemoteDebugApplicationThread} prdat 
     * @returns {HRESULT} 
     */
    OnCreateThread(prdat) {
        result := ComCall(10, this, "ptr", prdat, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IRemoteDebugApplicationThread} prdat 
     * @returns {HRESULT} 
     */
    OnDestroyThread(prdat) {
        result := ComCall(11, this, "ptr", prdat, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} abf 
     * @param {IRemoteDebugApplicationThread} prdatSteppingThread 
     * @returns {HRESULT} 
     */
    OnBreakFlagChange(abf, prdatSteppingThread) {
        result := ComCall(12, this, "uint", abf, "ptr", prdatSteppingThread, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
