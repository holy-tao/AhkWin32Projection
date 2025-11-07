#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugExpression.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugExpressionContext extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugExpressionContext
     * @type {Guid}
     */
    static IID => Guid("{51973c15-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ParseLanguageText", "GetLanguageInfo"]

    /**
     * 
     * @param {PWSTR} pstrCode 
     * @param {Integer} nRadix 
     * @param {PWSTR} pstrDelimiter 
     * @param {Integer} dwFlags 
     * @returns {IDebugExpression} 
     */
    ParseLanguageText(pstrCode, nRadix, pstrDelimiter, dwFlags) {
        pstrCode := pstrCode is String ? StrPtr(pstrCode) : pstrCode
        pstrDelimiter := pstrDelimiter is String ? StrPtr(pstrDelimiter) : pstrDelimiter

        result := ComCall(3, this, "ptr", pstrCode, "uint", nRadix, "ptr", pstrDelimiter, "uint", dwFlags, "ptr*", &ppe := 0, "HRESULT")
        return IDebugExpression(ppe)
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrLanguageName 
     * @param {Pointer<Guid>} pLanguageID 
     * @returns {HRESULT} 
     */
    GetLanguageInfo(pbstrLanguageName, pLanguageID) {
        result := ComCall(4, this, "ptr", pbstrLanguageName, "ptr", pLanguageID, "HRESULT")
        return result
    }
}
