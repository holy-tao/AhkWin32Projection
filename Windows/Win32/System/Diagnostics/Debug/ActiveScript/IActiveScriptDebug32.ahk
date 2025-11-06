#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IEnumDebugCodeContexts.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptDebug32 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScriptDebug32
     * @type {Guid}
     */
    static IID => Guid("{51973c10-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetScriptTextAttributes", "GetScriptletTextAttributes", "EnumCodeContextsOfPosition"]

    /**
     * 
     * @param {PWSTR} pstrCode 
     * @param {Integer} uNumCodeChars 
     * @param {PWSTR} pstrDelimiter 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} pattr 
     * @returns {HRESULT} 
     */
    GetScriptTextAttributes(pstrCode, uNumCodeChars, pstrDelimiter, dwFlags, pattr) {
        pstrCode := pstrCode is String ? StrPtr(pstrCode) : pstrCode
        pstrDelimiter := pstrDelimiter is String ? StrPtr(pstrDelimiter) : pstrDelimiter

        pattrMarshal := pattr is VarRef ? "ushort*" : "ptr"

        result := ComCall(3, this, "ptr", pstrCode, "uint", uNumCodeChars, "ptr", pstrDelimiter, "uint", dwFlags, pattrMarshal, pattr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pstrCode 
     * @param {Integer} uNumCodeChars 
     * @param {PWSTR} pstrDelimiter 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} pattr 
     * @returns {HRESULT} 
     */
    GetScriptletTextAttributes(pstrCode, uNumCodeChars, pstrDelimiter, dwFlags, pattr) {
        pstrCode := pstrCode is String ? StrPtr(pstrCode) : pstrCode
        pstrDelimiter := pstrDelimiter is String ? StrPtr(pstrDelimiter) : pstrDelimiter

        pattrMarshal := pattr is VarRef ? "ushort*" : "ptr"

        result := ComCall(4, this, "ptr", pstrCode, "uint", uNumCodeChars, "ptr", pstrDelimiter, "uint", dwFlags, pattrMarshal, pattr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSourceContext 
     * @param {Integer} uCharacterOffset 
     * @param {Integer} uNumChars 
     * @returns {IEnumDebugCodeContexts} 
     */
    EnumCodeContextsOfPosition(dwSourceContext, uCharacterOffset, uNumChars) {
        result := ComCall(5, this, "uint", dwSourceContext, "uint", uCharacterOffset, "uint", uNumChars, "ptr*", &ppescc := 0, "HRESULT")
        return IEnumDebugCodeContexts(ppescc)
    }
}
