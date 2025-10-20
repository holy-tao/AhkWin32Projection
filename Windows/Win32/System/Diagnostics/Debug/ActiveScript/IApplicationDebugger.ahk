#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IApplicationDebugger extends IUnknown{
    /**
     * The interface identifier for IApplicationDebugger
     * @type {Guid}
     */
    static IID => Guid("{51973c2a-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    QueryAlive() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @param {Integer} dwClsContext 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppvObject 
     * @returns {HRESULT} 
     */
    CreateInstanceAtDebugger(rclsid, pUnkOuter, dwClsContext, riid, ppvObject) {
        result := ComCall(4, this, "ptr", rclsid, "ptr", pUnkOuter, "uint", dwClsContext, "ptr", riid, "ptr", ppvObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pstr 
     * @returns {HRESULT} 
     */
    onDebugOutput(pstr) {
        pstr := pstr is String ? StrPtr(pstr) : pstr

        result := ComCall(5, this, "ptr", pstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRemoteDebugApplicationThread>} prpt 
     * @param {Integer} br 
     * @param {Pointer<IActiveScriptErrorDebug>} pError 
     * @returns {HRESULT} 
     */
    onHandleBreakPoint(prpt, br, pError) {
        result := ComCall(6, this, "ptr", prpt, "int", br, "ptr", pError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    onClose() {
        result := ComCall(7, this, "int")
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
    onDebuggerEvent(riid, punk) {
        result := ComCall(8, this, "ptr", riid, "ptr", punk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
