#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDiagnosticsScriptEngine extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDiagnosticsScriptEngine
     * @type {Guid}
     */
    static IID => Guid("{30510859-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EvaluateScript", "FireScriptMessageEvent", "Detach"]

    /**
     * 
     * @param {PWSTR} pszScript 
     * @param {PWSTR} pszScriptName 
     * @returns {HRESULT} 
     */
    EvaluateScript(pszScript, pszScriptName) {
        pszScript := pszScript is String ? StrPtr(pszScript) : pszScript
        pszScriptName := pszScriptName is String ? StrPtr(pszScriptName) : pszScriptName

        result := ComCall(3, this, "ptr", pszScript, "ptr", pszScriptName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pszNames 
     * @param {Pointer<PWSTR>} pszValues 
     * @param {Integer} ulPropertyCount 
     * @returns {HRESULT} 
     */
    FireScriptMessageEvent(pszNames, pszValues, ulPropertyCount) {
        pszNamesMarshal := pszNames is VarRef ? "ptr*" : "ptr"
        pszValuesMarshal := pszValues is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pszNamesMarshal, pszNames, pszValuesMarshal, pszValues, "uint", ulPropertyCount, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Detach() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
