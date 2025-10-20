#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IApplicationDebugger extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryAlive", "CreateInstanceAtDebugger", "onDebugOutput", "onHandleBreakPoint", "onClose", "onDebuggerEvent"]

    /**
     * 
     * @returns {HRESULT} 
     */
    QueryAlive() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {IUnknown} pUnkOuter 
     * @param {Integer} dwClsContext 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppvObject 
     * @returns {HRESULT} 
     */
    CreateInstanceAtDebugger(rclsid, pUnkOuter, dwClsContext, riid, ppvObject) {
        result := ComCall(4, this, "ptr", rclsid, "ptr", pUnkOuter, "uint", dwClsContext, "ptr", riid, "ptr*", ppvObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pstr 
     * @returns {HRESULT} 
     */
    onDebugOutput(pstr) {
        pstr := pstr is String ? StrPtr(pstr) : pstr

        result := ComCall(5, this, "ptr", pstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRemoteDebugApplicationThread} prpt 
     * @param {Integer} br 
     * @param {IActiveScriptErrorDebug} pError 
     * @returns {HRESULT} 
     */
    onHandleBreakPoint(prpt, br, pError) {
        result := ComCall(6, this, "ptr", prpt, "int", br, "ptr", pError, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    onClose() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     */
    onDebuggerEvent(riid, punk) {
        result := ComCall(8, this, "ptr", riid, "ptr", punk, "HRESULT")
        return result
    }
}
