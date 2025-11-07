#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IApplicationDebugger.ahk
#Include ..\..\..\Com\IUnknown.ahk
#Include .\IEnumRemoteDebugApplicationThreads.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include .\IDebugApplicationNode.ahk
#Include .\IEnumDebugExpressionContexts.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IRemoteDebugApplication extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteDebugApplication
     * @type {Guid}
     */
    static IID => Guid("{51973c30-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ResumeFromBreakPoint", "CauseBreak", "ConnectDebugger", "DisconnectDebugger", "GetDebugger", "CreateInstanceAtApplication", "QueryAlive", "EnumThreads", "GetName", "GetRootNode", "EnumGlobalExpressionContexts"]

    /**
     * 
     * @param {IRemoteDebugApplicationThread} prptFocus 
     * @param {Integer} bra 
     * @param {Integer} era 
     * @returns {HRESULT} 
     */
    ResumeFromBreakPoint(prptFocus, bra, era) {
        result := ComCall(3, this, "ptr", prptFocus, "int", bra, "int", era, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CauseBreak() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IApplicationDebugger} pad 
     * @returns {HRESULT} 
     */
    ConnectDebugger(pad) {
        result := ComCall(5, this, "ptr", pad, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisconnectDebugger() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IApplicationDebugger} 
     */
    GetDebugger() {
        result := ComCall(7, this, "ptr*", &pad := 0, "HRESULT")
        return IApplicationDebugger(pad)
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {IUnknown} pUnkOuter 
     * @param {Integer} dwClsContext 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    CreateInstanceAtApplication(rclsid, pUnkOuter, dwClsContext, riid) {
        result := ComCall(8, this, "ptr", rclsid, "ptr", pUnkOuter, "uint", dwClsContext, "ptr", riid, "ptr*", &ppvObject := 0, "HRESULT")
        return IUnknown(ppvObject)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    QueryAlive() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumRemoteDebugApplicationThreads} 
     */
    EnumThreads() {
        result := ComCall(10, this, "ptr*", &pperdat := 0, "HRESULT")
        return IEnumRemoteDebugApplicationThreads(pperdat)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetName() {
        pbstrName := BSTR()
        result := ComCall(11, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @returns {IDebugApplicationNode} 
     */
    GetRootNode() {
        result := ComCall(12, this, "ptr*", &ppdanRoot := 0, "HRESULT")
        return IDebugApplicationNode(ppdanRoot)
    }

    /**
     * 
     * @returns {IEnumDebugExpressionContexts} 
     */
    EnumGlobalExpressionContexts() {
        result := ComCall(13, this, "ptr*", &ppedec := 0, "HRESULT")
        return IEnumDebugExpressionContexts(ppedec)
    }
}
