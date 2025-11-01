#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptParseProcedureOld32 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScriptParseProcedureOld32
     * @type {Guid}
     */
    static IID => Guid("{1cff0050-6fdd-11d0-9328-00a0c90dcaa9}")

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
     * @param {PWSTR} pstrItemName 
     * @param {IUnknown} punkContext 
     * @param {PWSTR} pstrDelimiter 
     * @param {Integer} dwSourceContextCookie 
     * @param {Integer} ulStartingLineNumber 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDispatch>} ppdisp 
     * @returns {HRESULT} 
     */
    ParseProcedureText(pstrCode, pstrFormalParams, pstrItemName, punkContext, pstrDelimiter, dwSourceContextCookie, ulStartingLineNumber, dwFlags, ppdisp) {
        pstrCode := pstrCode is String ? StrPtr(pstrCode) : pstrCode
        pstrFormalParams := pstrFormalParams is String ? StrPtr(pstrFormalParams) : pstrFormalParams
        pstrItemName := pstrItemName is String ? StrPtr(pstrItemName) : pstrItemName
        pstrDelimiter := pstrDelimiter is String ? StrPtr(pstrDelimiter) : pstrDelimiter

        result := ComCall(3, this, "ptr", pstrCode, "ptr", pstrFormalParams, "ptr", pstrItemName, "ptr", punkContext, "ptr", pstrDelimiter, "uint", dwSourceContextCookie, "uint", ulStartingLineNumber, "uint", dwFlags, "ptr*", ppdisp, "HRESULT")
        return result
    }
}
