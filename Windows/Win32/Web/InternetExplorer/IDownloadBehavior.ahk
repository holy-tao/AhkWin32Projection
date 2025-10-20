#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IDownloadBehavior extends IDispatch{
    /**
     * The interface identifier for IDownloadBehavior
     * @type {Guid}
     */
    static IID => Guid("{3050f5bd-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @param {Pointer<IDispatch>} pdispCallback 
     * @returns {HRESULT} 
     */
    startDownload(bstrUrl, pdispCallback) {
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        result := ComCall(7, this, "ptr", bstrUrl, "ptr", pdispCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
