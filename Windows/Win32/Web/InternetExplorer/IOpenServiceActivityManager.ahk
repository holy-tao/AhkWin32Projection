#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IOpenServiceActivityManager extends IUnknown{
    /**
     * The interface identifier for IOpenServiceActivityManager
     * @type {Guid}
     */
    static IID => Guid("{8a2d0a9d-e920-4bdc-a291-d30f650bc4f1}")

    /**
     * The class identifier for OpenServiceActivityManager
     * @type {Guid}
     */
    static CLSID => Guid("{c5efd803-50f8-43cd-9ab8-aafc1394c9e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} eType 
     * @param {Pointer<IEnumOpenServiceActivityCategory>} ppEnum 
     * @returns {HRESULT} 
     */
    GetCategoryEnumerator(eType, ppEnum) {
        result := ComCall(3, this, "int", eType, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzActivityID 
     * @param {Pointer<IOpenServiceActivity>} ppActivity 
     * @returns {HRESULT} 
     */
    GetActivityByID(pwzActivityID, ppActivity) {
        pwzActivityID := pwzActivityID is String ? StrPtr(pwzActivityID) : pwzActivityID

        result := ComCall(4, this, "ptr", pwzActivityID, "ptr", ppActivity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzHomepage 
     * @param {PWSTR} pwzCategory 
     * @param {Pointer<IOpenServiceActivity>} ppActivity 
     * @returns {HRESULT} 
     */
    GetActivityByHomepageAndCategory(pwzHomepage, pwzCategory, ppActivity) {
        pwzHomepage := pwzHomepage is String ? StrPtr(pwzHomepage) : pwzHomepage
        pwzCategory := pwzCategory is String ? StrPtr(pwzCategory) : pwzCategory

        result := ComCall(5, this, "ptr", pwzHomepage, "ptr", pwzCategory, "ptr", ppActivity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwVersionCookie 
     * @returns {HRESULT} 
     */
    GetVersionCookie(pdwVersionCookie) {
        result := ComCall(6, this, "uint*", pdwVersionCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
