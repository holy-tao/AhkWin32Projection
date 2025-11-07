#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IURLSearchHook.ahk

/**
 * Exposes a method that is used by the browser to translate the address of an unknown URL protocol by using a search context object.
 * @remarks
 * 
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nn-shlobj_core-iurlsearchhook">IURLSearchHook</a> interface, from which it inherits.
 * 
 * When attempting to browse to a URL address, if the browser retrieves an <b>IURLSearchHook2</b> interface, a search context is passed to the browser. If no <b>IURLSearchHook2</b> interface is available the browser uses <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nn-shlobj_core-iurlsearchhook">IURLSearchHook</a> to determine the address of the unknown URL.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nn-shlobj_core-iurlsearchhook2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IURLSearchHook2 extends IURLSearchHook{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IURLSearchHook2
     * @type {Guid}
     */
    static IID => Guid("{5ee44da4-6d32-46e3-86bc-07540dedd0e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TranslateWithSearchContext"]

    /**
     * 
     * @param {PWSTR} pwszSearchURL 
     * @param {Integer} cchBufferSize 
     * @param {ISearchContext} pSearchContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-iurlsearchhook2-translatewithsearchcontext
     */
    TranslateWithSearchContext(pwszSearchURL, cchBufferSize, pSearchContext) {
        pwszSearchURL := pwszSearchURL is String ? StrPtr(pwszSearchURL) : pwszSearchURL

        result := ComCall(4, this, "ptr", pwszSearchURL, "uint", cchBufferSize, "ptr", pSearchContext, "HRESULT")
        return result
    }
}
