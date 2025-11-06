#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugDocumentHost extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugDocumentHost
     * @type {Guid}
     */
    static IID => Guid("{51973c27-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeferredText", "GetScriptTextAttributes", "OnCreateDocumentContext", "GetPathName", "GetFileName", "NotifyChanged"]

    /**
     * 
     * @param {Integer} dwTextStartCookie 
     * @param {PWSTR} pcharText 
     * @param {Pointer<Integer>} pstaTextAttr 
     * @param {Pointer<Integer>} pcNumChars 
     * @param {Integer} cMaxChars 
     * @returns {HRESULT} 
     */
    GetDeferredText(dwTextStartCookie, pcharText, pstaTextAttr, pcNumChars, cMaxChars) {
        pcharText := pcharText is String ? StrPtr(pcharText) : pcharText

        pstaTextAttrMarshal := pstaTextAttr is VarRef ? "ushort*" : "ptr"
        pcNumCharsMarshal := pcNumChars is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", dwTextStartCookie, "ptr", pcharText, pstaTextAttrMarshal, pstaTextAttr, pcNumCharsMarshal, pcNumChars, "uint", cMaxChars, "HRESULT")
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
    GetScriptTextAttributes(pstrCode, uNumCodeChars, pstrDelimiter, dwFlags, pattr) {
        pstrCode := pstrCode is String ? StrPtr(pstrCode) : pstrCode
        pstrDelimiter := pstrDelimiter is String ? StrPtr(pstrDelimiter) : pstrDelimiter

        pattrMarshal := pattr is VarRef ? "ushort*" : "ptr"

        result := ComCall(4, this, "ptr", pstrCode, "uint", uNumCodeChars, "ptr", pstrDelimiter, "uint", dwFlags, pattrMarshal, pattr, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    OnCreateDocumentContext() {
        result := ComCall(5, this, "ptr*", &ppunkOuter := 0, "HRESULT")
        return IUnknown(ppunkOuter)
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrLongName 
     * @param {Pointer<BOOL>} pfIsOriginalFile 
     * @returns {HRESULT} 
     */
    GetPathName(pbstrLongName, pfIsOriginalFile) {
        pfIsOriginalFileMarshal := pfIsOriginalFile is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", pbstrLongName, pfIsOriginalFileMarshal, pfIsOriginalFile, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetFileName() {
        pbstrShortName := BSTR()
        result := ComCall(7, this, "ptr", pbstrShortName, "HRESULT")
        return pbstrShortName
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NotifyChanged() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
