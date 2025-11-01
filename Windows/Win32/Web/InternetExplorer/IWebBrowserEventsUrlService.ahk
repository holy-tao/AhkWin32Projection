#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IWebBrowserEventsUrlService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebBrowserEventsUrlService
     * @type {Guid}
     */
    static IID => Guid("{87cc5d04-eafa-4833-9820-8f986530cc00}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUrlForEvents"]

    /**
     * 
     * @param {Pointer<BSTR>} pUrl 
     * @returns {HRESULT} 
     */
    GetUrlForEvents(pUrl) {
        result := ComCall(3, this, "ptr", pUrl, "HRESULT")
        return result
    }
}
