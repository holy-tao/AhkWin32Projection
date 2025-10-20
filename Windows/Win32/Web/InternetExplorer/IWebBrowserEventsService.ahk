#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IWebBrowserEventsService extends IUnknown{
    /**
     * The interface identifier for IWebBrowserEventsService
     * @type {Guid}
     */
    static IID => Guid("{54a8f188-9ebd-4795-ad16-9b4945119636}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfCancel 
     * @returns {HRESULT} 
     */
    FireBeforeNavigate2Event(pfCancel) {
        result := ComCall(3, this, "ptr", pfCancel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FireNavigateComplete2Event() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FireDownloadBeginEvent() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FireDownloadCompleteEvent() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FireDocumentCompleteEvent() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
