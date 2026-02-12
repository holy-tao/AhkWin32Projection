#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that channel customization information to the search hooks.
 * @see https://learn.microsoft.com/windows/win32/api//content/shlobj_core/nn-shlobj_core-isearchcontext
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
     * Retrieves the URL that is being searched for.
     * @returns {BSTR} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a></b>
     * 
     * The <b>BSTR</b> that receives the URL.
     * @see https://learn.microsoft.com/windows/win32/api//content/shlobj_core/nf-shlobj_core-isearchcontext-getsearchurl
     */
    GetSearchUrl() {
        pbstrSearchUrl := BSTR()
        result := ComCall(3, this, "ptr", pbstrSearchUrl, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrSearchUrl
    }

    /**
     * Retrieves the text that is in the browser's Address bar.
     * @returns {BSTR} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a></b>
     * 
     * The <b>BSTR</b> that receives the text in the Address bar.
     * @see https://learn.microsoft.com/windows/win32/api//content/shlobj_core/nf-shlobj_core-isearchcontext-getsearchtext
     */
    GetSearchText() {
        pbstrSearchText := BSTR()
        result := ComCall(4, this, "ptr", pbstrSearchText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrSearchText
    }

    /**
     * Overrides the registry settings that determine how an autosearch is performed.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * A pointer to a <b>DWORD</b> value that indicates how the search is performed.
     * @see https://learn.microsoft.com/windows/win32/api//content/shlobj_core/nf-shlobj_core-isearchcontext-getsearchstyle
     */
    GetSearchStyle() {
        result := ComCall(5, this, "uint*", &pdwSearchStyle := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwSearchStyle
    }
}
