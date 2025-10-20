#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptSite extends IUnknown{
    /**
     * The interface identifier for IActiveScriptSite
     * @type {Guid}
     */
    static IID => Guid("{db01a1e3-a42b-11cf-8f20-00805f2cd064}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} plcid 
     * @returns {HRESULT} 
     */
    GetLCID(plcid) {
        result := ComCall(3, this, "uint*", plcid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pstrName 
     * @param {Integer} dwReturnMask 
     * @param {Pointer<IUnknown>} ppiunkItem 
     * @param {Pointer<ITypeInfo>} ppti 
     * @returns {HRESULT} 
     */
    GetItemInfo(pstrName, dwReturnMask, ppiunkItem, ppti) {
        pstrName := pstrName is String ? StrPtr(pstrName) : pstrName

        result := ComCall(4, this, "ptr", pstrName, "uint", dwReturnMask, "ptr", ppiunkItem, "ptr", ppti, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrVersion 
     * @returns {HRESULT} 
     */
    GetDocVersionString(pbstrVersion) {
        result := ComCall(5, this, "ptr", pbstrVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarResult 
     * @param {Pointer<EXCEPINFO>} pexcepinfo 
     * @returns {HRESULT} 
     */
    OnScriptTerminate(pvarResult, pexcepinfo) {
        result := ComCall(6, this, "ptr", pvarResult, "ptr", pexcepinfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ssScriptState 
     * @returns {HRESULT} 
     */
    OnStateChange(ssScriptState) {
        result := ComCall(7, this, "int", ssScriptState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IActiveScriptError>} pscripterror 
     * @returns {HRESULT} 
     */
    OnScriptError(pscripterror) {
        result := ComCall(8, this, "ptr", pscripterror, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnEnterScript() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnLeaveScript() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
