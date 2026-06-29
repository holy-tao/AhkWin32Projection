#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IHomePage extends IDispatch {
    /**
     * The interface identifier for IHomePage
     * @type {Guid}
     */
    static IID := Guid("{766bf2af-d650-11d1-9811-00c04fc31d2e}")

    /**
     * The class identifier for HomePage
     * @type {Guid}
     */
    static CLSID := Guid("{766bf2ae-d650-11d1-9811-00c04fc31d2e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHomePage interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        navigateHomePage : IntPtr
        setHomePage      : IntPtr
        isHomePage       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHomePage.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

        result := ComCall(8, this, BSTR, bstrURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrURL 
     * @returns {VARIANT_BOOL} 
     */
    isHomePage(bstrURL) {
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL

        result := ComCall(9, this, BSTR, bstrURL, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHomePage.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.navigateHomePage := CallbackCreate(GetMethod(implObj, "navigateHomePage"), flags, 1)
        this.vtbl.setHomePage := CallbackCreate(GetMethod(implObj, "setHomePage"), flags, 2)
        this.vtbl.isHomePage := CallbackCreate(GetMethod(implObj, "isHomePage"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.navigateHomePage)
        CallbackFree(this.vtbl.setHomePage)
        CallbackFree(this.vtbl.isHomePage)
    }
}
