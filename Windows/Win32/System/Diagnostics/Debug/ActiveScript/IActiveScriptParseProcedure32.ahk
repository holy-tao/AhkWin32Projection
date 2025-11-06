#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IDispatch.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptParseProcedure32 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScriptParseProcedure32
     * @type {Guid}
     */
    static IID => Guid("{aa5b6a80-b834-11d0-932f-00a0c90dcaa9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ParseProcedureText"]

    /**
     * 
     * @param {PWSTR} pstrCode 
     * @param {PWSTR} pstrFormalParams 
     * @param {PWSTR} pstrProcedureName 
     * @param {PWSTR} pstrItemName 
     * @param {IUnknown} punkContext 
     * @param {PWSTR} pstrDelimiter 
     * @param {Integer} dwSourceContextCookie 
     * @param {Integer} ulStartingLineNumber 
     * @param {Integer} dwFlags 
     * @returns {IDispatch} 
     */
    ParseProcedureText(pstrCode, pstrFormalParams, pstrProcedureName, pstrItemName, punkContext, pstrDelimiter, dwSourceContextCookie, ulStartingLineNumber, dwFlags) {
        pstrCode := pstrCode is String ? StrPtr(pstrCode) : pstrCode
        pstrFormalParams := pstrFormalParams is String ? StrPtr(pstrFormalParams) : pstrFormalParams
        pstrProcedureName := pstrProcedureName is String ? StrPtr(pstrProcedureName) : pstrProcedureName
        pstrItemName := pstrItemName is String ? StrPtr(pstrItemName) : pstrItemName
        pstrDelimiter := pstrDelimiter is String ? StrPtr(pstrDelimiter) : pstrDelimiter

        result := ComCall(3, this, "ptr", pstrCode, "ptr", pstrFormalParams, "ptr", pstrProcedureName, "ptr", pstrItemName, "ptr", punkContext, "ptr", pstrDelimiter, "uint", dwSourceContextCookie, "uint", ulStartingLineNumber, "uint", dwFlags, "ptr*", &ppdisp := 0, "HRESULT")
        return IDispatch(ppdisp)
    }
}
