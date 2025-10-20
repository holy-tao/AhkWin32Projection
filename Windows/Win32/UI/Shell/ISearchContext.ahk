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
     * 
     * @param {Pointer<BSTR>} pbstrSearchUrl 
     * @returns {HRESULT} 
     */
    GetSearchUrl(pbstrSearchUrl) {
        result := ComCall(3, this, "ptr", pbstrSearchUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSearchText 
     * @returns {HRESULT} 
     */
    GetSearchText(pbstrSearchText) {
        result := ComCall(4, this, "ptr", pbstrSearchText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwSearchStyle 
     * @returns {HRESULT} 
     */
    GetSearchStyle(pdwSearchStyle) {
        result := ComCall(5, this, "uint*", pdwSearchStyle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
