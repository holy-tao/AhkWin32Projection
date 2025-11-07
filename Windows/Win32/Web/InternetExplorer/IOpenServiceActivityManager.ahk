#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumOpenServiceActivityCategory.ahk
#Include .\IOpenServiceActivity.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IOpenServiceActivityManager extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCategoryEnumerator", "GetActivityByID", "GetActivityByHomepageAndCategory", "GetVersionCookie"]

    /**
     * 
     * @param {Integer} eType 
     * @returns {IEnumOpenServiceActivityCategory} 
     */
    GetCategoryEnumerator(eType) {
        result := ComCall(3, this, "int", eType, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumOpenServiceActivityCategory(ppEnum)
    }

    /**
     * 
     * @param {PWSTR} pwzActivityID 
     * @returns {IOpenServiceActivity} 
     */
    GetActivityByID(pwzActivityID) {
        pwzActivityID := pwzActivityID is String ? StrPtr(pwzActivityID) : pwzActivityID

        result := ComCall(4, this, "ptr", pwzActivityID, "ptr*", &ppActivity := 0, "HRESULT")
        return IOpenServiceActivity(ppActivity)
    }

    /**
     * 
     * @param {PWSTR} pwzHomepage 
     * @param {PWSTR} pwzCategory 
     * @returns {IOpenServiceActivity} 
     */
    GetActivityByHomepageAndCategory(pwzHomepage, pwzCategory) {
        pwzHomepage := pwzHomepage is String ? StrPtr(pwzHomepage) : pwzHomepage
        pwzCategory := pwzCategory is String ? StrPtr(pwzCategory) : pwzCategory

        result := ComCall(5, this, "ptr", pwzHomepage, "ptr", pwzCategory, "ptr*", &ppActivity := 0, "HRESULT")
        return IOpenServiceActivity(ppActivity)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetVersionCookie() {
        result := ComCall(6, this, "uint*", &pdwVersionCookie := 0, "HRESULT")
        return pdwVersionCookie
    }
}
