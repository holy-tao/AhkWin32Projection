#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptParse64 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScriptParse64
     * @type {Guid}
     */
    static IID => Guid("{c7ef7658-e1ee-480e-97ea-d52cb4d76d17}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitNew", "AddScriptlet", "ParseScriptText"]

    /**
     * 
     * @returns {HRESULT} 
     */
    InitNew() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pstrDefaultName 
     * @param {PWSTR} pstrCode 
     * @param {PWSTR} pstrItemName 
     * @param {PWSTR} pstrSubItemName 
     * @param {PWSTR} pstrEventName 
     * @param {PWSTR} pstrDelimiter 
     * @param {Integer} dwSourceContextCookie 
     * @param {Integer} ulStartingLineNumber 
     * @param {Integer} dwFlags 
     * @param {Pointer<BSTR>} pbstrName 
     * @param {Pointer<EXCEPINFO>} pexcepinfo 
     * @returns {HRESULT} 
     */
    AddScriptlet(pstrDefaultName, pstrCode, pstrItemName, pstrSubItemName, pstrEventName, pstrDelimiter, dwSourceContextCookie, ulStartingLineNumber, dwFlags, pbstrName, pexcepinfo) {
        pstrDefaultName := pstrDefaultName is String ? StrPtr(pstrDefaultName) : pstrDefaultName
        pstrCode := pstrCode is String ? StrPtr(pstrCode) : pstrCode
        pstrItemName := pstrItemName is String ? StrPtr(pstrItemName) : pstrItemName
        pstrSubItemName := pstrSubItemName is String ? StrPtr(pstrSubItemName) : pstrSubItemName
        pstrEventName := pstrEventName is String ? StrPtr(pstrEventName) : pstrEventName
        pstrDelimiter := pstrDelimiter is String ? StrPtr(pstrDelimiter) : pstrDelimiter

        result := ComCall(4, this, "ptr", pstrDefaultName, "ptr", pstrCode, "ptr", pstrItemName, "ptr", pstrSubItemName, "ptr", pstrEventName, "ptr", pstrDelimiter, "uint", dwSourceContextCookie, "uint", ulStartingLineNumber, "uint", dwFlags, "ptr", pbstrName, "ptr", pexcepinfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pstrCode 
     * @param {PWSTR} pstrItemName 
     * @param {IUnknown} punkContext 
     * @param {PWSTR} pstrDelimiter 
     * @param {Integer} dwSourceContextCookie 
     * @param {Integer} ulStartingLineNumber 
     * @param {Integer} dwFlags 
     * @param {Pointer<VARIANT>} pvarResult 
     * @param {Pointer<EXCEPINFO>} pexcepinfo 
     * @returns {HRESULT} 
     */
    ParseScriptText(pstrCode, pstrItemName, punkContext, pstrDelimiter, dwSourceContextCookie, ulStartingLineNumber, dwFlags, pvarResult, pexcepinfo) {
        pstrCode := pstrCode is String ? StrPtr(pstrCode) : pstrCode
        pstrItemName := pstrItemName is String ? StrPtr(pstrItemName) : pstrItemName
        pstrDelimiter := pstrDelimiter is String ? StrPtr(pstrDelimiter) : pstrDelimiter

        result := ComCall(5, this, "ptr", pstrCode, "ptr", pstrItemName, "ptr", punkContext, "ptr", pstrDelimiter, "uint", dwSourceContextCookie, "uint", ulStartingLineNumber, "uint", dwFlags, "ptr", pvarResult, "ptr", pexcepinfo, "HRESULT")
        return result
    }
}
