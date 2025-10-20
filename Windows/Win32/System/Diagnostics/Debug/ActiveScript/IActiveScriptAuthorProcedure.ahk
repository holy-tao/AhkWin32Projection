#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptAuthorProcedure extends IUnknown{
    /**
     * The interface identifier for IActiveScriptAuthorProcedure
     * @type {Guid}
     */
    static IID => Guid("{7e2d4b70-bd9a-11d0-9336-00a0c90dcaa9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszCode 
     * @param {PWSTR} pszFormalParams 
     * @param {PWSTR} pszProcedureName 
     * @param {PWSTR} pszItemName 
     * @param {PWSTR} pszDelimiter 
     * @param {Integer} dwCookie 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDispatch>} pdispFor 
     * @returns {HRESULT} 
     */
    ParseProcedureText(pszCode, pszFormalParams, pszProcedureName, pszItemName, pszDelimiter, dwCookie, dwFlags, pdispFor) {
        pszCode := pszCode is String ? StrPtr(pszCode) : pszCode
        pszFormalParams := pszFormalParams is String ? StrPtr(pszFormalParams) : pszFormalParams
        pszProcedureName := pszProcedureName is String ? StrPtr(pszProcedureName) : pszProcedureName
        pszItemName := pszItemName is String ? StrPtr(pszItemName) : pszItemName
        pszDelimiter := pszDelimiter is String ? StrPtr(pszDelimiter) : pszDelimiter

        result := ComCall(3, this, "ptr", pszCode, "ptr", pszFormalParams, "ptr", pszProcedureName, "ptr", pszItemName, "ptr", pszDelimiter, "uint", dwCookie, "uint", dwFlags, "ptr", pdispFor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
