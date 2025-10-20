#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IRemoteDebugApplication extends IUnknown{
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
     * 
     * @param {Pointer<IRemoteDebugApplicationThread>} prptFocus 
     * @param {Integer} bra 
     * @param {Integer} era 
     * @returns {HRESULT} 
     */
    ResumeFromBreakPoint(prptFocus, bra, era) {
        result := ComCall(3, this, "ptr", prptFocus, "int", bra, "int", era, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CauseBreak() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IApplicationDebugger>} pad 
     * @returns {HRESULT} 
     */
    ConnectDebugger(pad) {
        result := ComCall(5, this, "ptr", pad, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisconnectDebugger() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IApplicationDebugger>} pad 
     * @returns {HRESULT} 
     */
    GetDebugger(pad) {
        result := ComCall(7, this, "ptr", pad, "int")
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
    CreateInstanceAtApplication(rclsid, pUnkOuter, dwClsContext, riid, ppvObject) {
        result := ComCall(8, this, "ptr", rclsid, "ptr", pUnkOuter, "uint", dwClsContext, "ptr", riid, "ptr", ppvObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    QueryAlive() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumRemoteDebugApplicationThreads>} pperdat 
     * @returns {HRESULT} 
     */
    EnumThreads(pperdat) {
        result := ComCall(10, this, "ptr", pperdat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    GetName(pbstrName) {
        result := ComCall(11, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugApplicationNode>} ppdanRoot 
     * @returns {HRESULT} 
     */
    GetRootNode(ppdanRoot) {
        result := ComCall(12, this, "ptr", ppdanRoot, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumDebugExpressionContexts>} ppedec 
     * @returns {HRESULT} 
     */
    EnumGlobalExpressionContexts(ppedec) {
        result := ComCall(13, this, "ptr", ppedec, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
