#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IOpenServiceActivity.ahk" { IOpenServiceActivity }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumOpenServiceActivityCategory.ahk" { IEnumOpenServiceActivityCategory }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\OpenServiceActivityContentType.ahk" { OpenServiceActivityContentType }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IOpenServiceActivityManager extends IUnknown {
    /**
     * The interface identifier for IOpenServiceActivityManager
     * @type {Guid}
     */
    static IID := Guid("{8a2d0a9d-e920-4bdc-a291-d30f650bc4f1}")

    /**
     * The class identifier for OpenServiceActivityManager
     * @type {Guid}
     */
    static CLSID := Guid("{c5efd803-50f8-43cd-9ab8-aafc1394c9e0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOpenServiceActivityManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCategoryEnumerator            : IntPtr
        GetActivityByID                  : IntPtr
        GetActivityByHomepageAndCategory : IntPtr
        GetVersionCookie                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOpenServiceActivityManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {OpenServiceActivityContentType} eType 
     * @returns {IEnumOpenServiceActivityCategory} 
     */
    GetCategoryEnumerator(eType) {
        result := ComCall(3, this, OpenServiceActivityContentType, eType, "ptr*", &ppEnum := 0, "HRESULT")
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

    Query(iid) {
        if (IOpenServiceActivityManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCategoryEnumerator := CallbackCreate(GetMethod(implObj, "GetCategoryEnumerator"), flags, 3)
        this.vtbl.GetActivityByID := CallbackCreate(GetMethod(implObj, "GetActivityByID"), flags, 3)
        this.vtbl.GetActivityByHomepageAndCategory := CallbackCreate(GetMethod(implObj, "GetActivityByHomepageAndCategory"), flags, 4)
        this.vtbl.GetVersionCookie := CallbackCreate(GetMethod(implObj, "GetVersionCookie"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCategoryEnumerator)
        CallbackFree(this.vtbl.GetActivityByID)
        CallbackFree(this.vtbl.GetActivityByHomepageAndCategory)
        CallbackFree(this.vtbl.GetVersionCookie)
    }
}
