#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that is used by the browser to translate the address of an unknown URL protocol.
 * @remarks
 * 
 * When attempting to browse to a URL address that does not contain a protocol, the browser will first attempt to determine the correct protocol from the address. If this is not successful, the browser will create URL Search Hook objects and call each object's <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-iurlsearchhook-translate">Translate</a> method until the address is translated or all of the hooks have been queried.
 * 
 * URL Search Hooks are registered by adding a value that contains the object's class identifier (CLSID) string under the following key in the registry: 
 * 				
 * <pre xml:space="preserve"><b>HKEY_LOCAL_MACHINE</b>
 *    <b>Software</b>
 *       <b>Microsoft</b>
 *          <b>Internet Explorer</b>
 *             <b>UrlSearchHooks</b></pre>
 * 
 * 
 * Implement this interface if your application defines a custom URL protocol and if address translation for this protocol is required.
 * 
 * You do not typically use this interface; it is called by the browser.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nn-shlobj_core-iurlsearchhook
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IURLSearchHook extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IURLSearchHook
     * @type {Guid}
     */
    static IID => Guid("{ac60f6a0-0fd9-11d0-99cb-00c04fd64497}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Translate"]

    /**
     * 
     * @param {PWSTR} pwszSearchURL 
     * @param {Integer} cchBufferSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-iurlsearchhook-translate
     */
    Translate(pwszSearchURL, cchBufferSize) {
        pwszSearchURL := pwszSearchURL is String ? StrPtr(pwszSearchURL) : pwszSearchURL

        result := ComCall(3, this, "ptr", pwszSearchURL, "uint", cchBufferSize, "HRESULT")
        return result
    }
}
