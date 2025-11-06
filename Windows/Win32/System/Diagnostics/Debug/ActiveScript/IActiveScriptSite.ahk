#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptSite extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLCID", "GetItemInfo", "GetDocVersionString", "OnScriptTerminate", "OnStateChange", "OnScriptError", "OnEnterScript", "OnLeaveScript"]

    /**
     * 
     * @returns {Integer} 
     */
    GetLCID() {
        result := ComCall(3, this, "uint*", &plcid := 0, "HRESULT")
        return plcid
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

        result := ComCall(4, this, "ptr", pstrName, "uint", dwReturnMask, "ptr*", ppiunkItem, "ptr*", ppti, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetDocVersionString() {
        pbstrVersion := BSTR()
        result := ComCall(5, this, "ptr", pbstrVersion, "HRESULT")
        return pbstrVersion
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarResult 
     * @param {Pointer<EXCEPINFO>} pexcepinfo 
     * @returns {HRESULT} 
     */
    OnScriptTerminate(pvarResult, pexcepinfo) {
        result := ComCall(6, this, "ptr", pvarResult, "ptr", pexcepinfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ssScriptState 
     * @returns {HRESULT} 
     */
    OnStateChange(ssScriptState) {
        result := ComCall(7, this, "int", ssScriptState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IActiveScriptError} pscripterror 
     * @returns {HRESULT} 
     */
    OnScriptError(pscripterror) {
        result := ComCall(8, this, "ptr", pscripterror, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnEnterScript() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnLeaveScript() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
