#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDiagnosticsScriptEngineSite extends IUnknown{
    /**
     * The interface identifier for IDiagnosticsScriptEngineSite
     * @type {Guid}
     */
    static IID => Guid("{30510858-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} pszData 
     * @param {Integer} ulDataCount 
     * @returns {HRESULT} 
     */
    OnMessage(pszData, ulDataCount) {
        result := ComCall(3, this, "ptr", pszData, "uint", ulDataCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IActiveScriptError>} pScriptError 
     * @returns {HRESULT} 
     */
    OnScriptError(pScriptError) {
        result := ComCall(4, this, "ptr", pScriptError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
