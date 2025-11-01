#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IHomePage extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHomePage
     * @type {Guid}
     */
    static IID => Guid("{766bf2af-d650-11d1-9811-00c04fc31d2e}")

    /**
     * The class identifier for HomePage
     * @type {Guid}
     */
    static CLSID => Guid("{766bf2ae-d650-11d1-9811-00c04fc31d2e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["navigateHomePage", "setHomePage", "isHomePage"]

    /**
     * 
     * @returns {HRESULT} 
     */
    navigateHomePage() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrURL 
     * @returns {HRESULT} 
     */
    setHomePage(bstrURL) {
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL

        result := ComCall(8, this, "ptr", bstrURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrURL 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    isHomePage(bstrURL, p) {
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL

        result := ComCall(9, this, "ptr", bstrURL, "ptr", p, "HRESULT")
        return result
    }
}
