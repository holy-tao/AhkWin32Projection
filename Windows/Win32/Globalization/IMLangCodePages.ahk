#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class IMLangCodePages extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMLangCodePages
     * @type {Guid}
     */
    static IID => Guid("{359f3443-bd4a-11d0-b188-00aa0038c969}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCharCodePages", "GetStrCodePages", "CodePageToCodePages", "CodePagesToCodePage"]

    /**
     * 
     * @param {Integer} chSrc 
     * @param {Pointer<Integer>} pdwCodePages 
     * @returns {HRESULT} 
     */
    GetCharCodePages(chSrc, pdwCodePages) {
        result := ComCall(3, this, "char", chSrc, "uint*", pdwCodePages, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszSrc 
     * @param {Integer} cchSrc 
     * @param {Integer} dwPriorityCodePages 
     * @param {Pointer<Integer>} pdwCodePages 
     * @param {Pointer<Integer>} pcchCodePages 
     * @returns {HRESULT} 
     */
    GetStrCodePages(pszSrc, cchSrc, dwPriorityCodePages, pdwCodePages, pcchCodePages) {
        pszSrc := pszSrc is String ? StrPtr(pszSrc) : pszSrc

        result := ComCall(4, this, "ptr", pszSrc, "int", cchSrc, "uint", dwPriorityCodePages, "uint*", pdwCodePages, "int*", pcchCodePages, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uCodePage 
     * @param {Pointer<Integer>} pdwCodePages 
     * @returns {HRESULT} 
     */
    CodePageToCodePages(uCodePage, pdwCodePages) {
        result := ComCall(5, this, "uint", uCodePage, "uint*", pdwCodePages, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCodePages 
     * @param {Integer} uDefaultCodePage 
     * @param {Pointer<Integer>} puCodePage 
     * @returns {HRESULT} 
     */
    CodePagesToCodePage(dwCodePages, uDefaultCodePage, puCodePage) {
        result := ComCall(6, this, "uint", dwCodePages, "uint", uDefaultCodePage, "uint*", puCodePage, "HRESULT")
        return result
    }
}
