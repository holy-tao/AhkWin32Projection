#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct Iwfolders extends IDispatch {
    /**
     * The interface identifier for Iwfolders
     * @type {Guid}
     */
    static IID := Guid("{bae31f98-1b81-11d2-a97a-00c04f8ecb02}")

    /**
     * The class identifier for wfolders
     * @type {Guid}
     */
    static CLSID := Guid("{bae31f9a-1b81-11d2-a97a-00c04f8ecb02}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for Iwfolders interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        navigate       : IntPtr
        navigateFrame  : IntPtr
        navigateNoSite : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := Iwfolders.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @returns {BSTR} 
     */
    navigate(bstrUrl) {
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        pbstrRetVal := BSTR.Owned()
        result := ComCall(7, this, BSTR, bstrUrl, BSTR.Ptr, pbstrRetVal, "HRESULT")
        return pbstrRetVal
    }

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @param {BSTR} bstrTargetFrame 
     * @returns {BSTR} 
     */
    navigateFrame(bstrUrl, bstrTargetFrame) {
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl
        bstrTargetFrame := bstrTargetFrame is String ? BSTR.Alloc(bstrTargetFrame).Value : bstrTargetFrame

        pbstrRetVal := BSTR.Owned()
        result := ComCall(8, this, BSTR, bstrUrl, BSTR, bstrTargetFrame, BSTR.Ptr, pbstrRetVal, "HRESULT")
        return pbstrRetVal
    }

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @param {BSTR} bstrTargetFrame 
     * @param {Integer} dwhwnd 
     * @param {IUnknown} pwb 
     * @returns {HRESULT} 
     */
    navigateNoSite(bstrUrl, bstrTargetFrame, dwhwnd, pwb) {
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl
        bstrTargetFrame := bstrTargetFrame is String ? BSTR.Alloc(bstrTargetFrame).Value : bstrTargetFrame

        result := ComCall(9, this, BSTR, bstrUrl, BSTR, bstrTargetFrame, "uint", dwhwnd, "ptr", pwb, "HRESULT")
        return result
    }

    Query(iid) {
        if (Iwfolders.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.navigate := CallbackCreate(GetMethod(implObj, "navigate"), flags, 3)
        this.vtbl.navigateFrame := CallbackCreate(GetMethod(implObj, "navigateFrame"), flags, 4)
        this.vtbl.navigateNoSite := CallbackCreate(GetMethod(implObj, "navigateNoSite"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.navigate)
        CallbackFree(this.vtbl.navigateFrame)
        CallbackFree(this.vtbl.navigateNoSite)
    }
}
