#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class IMLangCodePages extends IUnknown{
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
     * 
     * @param {Integer} chSrc 
     * @param {Pointer<UInt32>} pdwCodePages 
     * @returns {HRESULT} 
     */
    GetCharCodePages(chSrc, pdwCodePages) {
        result := ComCall(3, this, "char", chSrc, "uint*", pdwCodePages, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszSrc 
     * @param {Integer} cchSrc 
     * @param {Integer} dwPriorityCodePages 
     * @param {Pointer<UInt32>} pdwCodePages 
     * @param {Pointer<Int32>} pcchCodePages 
     * @returns {HRESULT} 
     */
    GetStrCodePages(pszSrc, cchSrc, dwPriorityCodePages, pdwCodePages, pcchCodePages) {
        pszSrc := pszSrc is String ? StrPtr(pszSrc) : pszSrc

        result := ComCall(4, this, "ptr", pszSrc, "int", cchSrc, "uint", dwPriorityCodePages, "uint*", pdwCodePages, "int*", pcchCodePages, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uCodePage 
     * @param {Pointer<UInt32>} pdwCodePages 
     * @returns {HRESULT} 
     */
    CodePageToCodePages(uCodePage, pdwCodePages) {
        result := ComCall(5, this, "uint", uCodePage, "uint*", pdwCodePages, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCodePages 
     * @param {Integer} uDefaultCodePage 
     * @param {Pointer<UInt32>} puCodePage 
     * @returns {HRESULT} 
     */
    CodePagesToCodePage(dwCodePages, uDefaultCodePage, puCodePage) {
        result := ComCall(6, this, "uint", dwCodePages, "uint", uDefaultCodePage, "uint*", puCodePage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
