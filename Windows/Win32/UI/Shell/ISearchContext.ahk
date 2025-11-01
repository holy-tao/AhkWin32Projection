#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that channel customization information to the search hooks.
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nn-shlobj_core-isearchcontext
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISearchContext extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchContext
     * @type {Guid}
     */
    static IID => Guid("{09f656a2-41af-480c-88f7-16cc0d164615}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSearchUrl", "GetSearchText", "GetSearchStyle"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSearchUrl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-isearchcontext-getsearchurl
     */
    GetSearchUrl(pbstrSearchUrl) {
        result := ComCall(3, this, "ptr", pbstrSearchUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSearchText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-isearchcontext-getsearchtext
     */
    GetSearchText(pbstrSearchText) {
        result := ComCall(4, this, "ptr", pbstrSearchText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwSearchStyle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-isearchcontext-getsearchstyle
     */
    GetSearchStyle(pdwSearchStyle) {
        pdwSearchStyleMarshal := pdwSearchStyle is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwSearchStyleMarshal, pdwSearchStyle, "HRESULT")
        return result
    }
}
