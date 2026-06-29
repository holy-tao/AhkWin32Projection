#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCSessionCallControl extends IUnknown {
    /**
     * The interface identifier for IRTCSessionCallControl
     * @type {Guid}
     */
    static IID := Guid("{e9a50d94-190b-4f82-9530-3b8ebf60758a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCSessionCallControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Hold              : IntPtr
        UnHold            : IntPtr
        Forward           : IntPtr
        Refer             : IntPtr
        put_ReferredByURI : IntPtr
        get_ReferredByURI : IntPtr
        put_ReferCookie   : IntPtr
        get_ReferCookie   : IntPtr
        get_IsReferred    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCSessionCallControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    ReferredByURI {
        get => this.get_ReferredByURI()
        set => this.put_ReferredByURI(value)
    }

    /**
     * @type {BSTR} 
     */
    ReferCookie {
        get => this.get_ReferCookie()
        set => this.put_ReferCookie(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsReferred {
        get => this.get_IsReferred()
    }

    /**
     * The IADsHold interface provides methods for an ADSI client to access the Hold attribute.
     * @param {Pointer} lCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadshold
     */
    Hold(lCookie) {
        result := ComCall(3, this, "ptr", lCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} lCookie 
     * @returns {HRESULT} 
     */
    UnHold(lCookie) {
        result := ComCall(4, this, "ptr", lCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrForwardToURI 
     * @returns {HRESULT} 
     */
    Forward(bstrForwardToURI) {
        bstrForwardToURI := bstrForwardToURI is String ? BSTR.Alloc(bstrForwardToURI).Value : bstrForwardToURI

        result := ComCall(5, this, BSTR, bstrForwardToURI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrReferToURI 
     * @param {BSTR} bstrReferCookie 
     * @returns {HRESULT} 
     */
    Refer(bstrReferToURI, bstrReferCookie) {
        bstrReferToURI := bstrReferToURI is String ? BSTR.Alloc(bstrReferToURI).Value : bstrReferToURI
        bstrReferCookie := bstrReferCookie is String ? BSTR.Alloc(bstrReferCookie).Value : bstrReferCookie

        result := ComCall(6, this, BSTR, bstrReferToURI, BSTR, bstrReferCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrReferredByURI 
     * @returns {HRESULT} 
     */
    put_ReferredByURI(bstrReferredByURI) {
        bstrReferredByURI := bstrReferredByURI is String ? BSTR.Alloc(bstrReferredByURI).Value : bstrReferredByURI

        result := ComCall(7, this, BSTR, bstrReferredByURI, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ReferredByURI() {
        pbstrReferredByURI := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbstrReferredByURI, "HRESULT")
        return pbstrReferredByURI
    }

    /**
     * 
     * @param {BSTR} bstrReferCookie 
     * @returns {HRESULT} 
     */
    put_ReferCookie(bstrReferCookie) {
        bstrReferCookie := bstrReferCookie is String ? BSTR.Alloc(bstrReferCookie).Value : bstrReferCookie

        result := ComCall(9, this, BSTR, bstrReferCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ReferCookie() {
        pbstrReferCookie := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pbstrReferCookie, "HRESULT")
        return pbstrReferCookie
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsReferred() {
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &pfIsReferred := 0, "HRESULT")
        return pfIsReferred
    }

    Query(iid) {
        if (IRTCSessionCallControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Hold := CallbackCreate(GetMethod(implObj, "Hold"), flags, 2)
        this.vtbl.UnHold := CallbackCreate(GetMethod(implObj, "UnHold"), flags, 2)
        this.vtbl.Forward := CallbackCreate(GetMethod(implObj, "Forward"), flags, 2)
        this.vtbl.Refer := CallbackCreate(GetMethod(implObj, "Refer"), flags, 3)
        this.vtbl.put_ReferredByURI := CallbackCreate(GetMethod(implObj, "put_ReferredByURI"), flags, 2)
        this.vtbl.get_ReferredByURI := CallbackCreate(GetMethod(implObj, "get_ReferredByURI"), flags, 2)
        this.vtbl.put_ReferCookie := CallbackCreate(GetMethod(implObj, "put_ReferCookie"), flags, 2)
        this.vtbl.get_ReferCookie := CallbackCreate(GetMethod(implObj, "get_ReferCookie"), flags, 2)
        this.vtbl.get_IsReferred := CallbackCreate(GetMethod(implObj, "get_IsReferred"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Hold)
        CallbackFree(this.vtbl.UnHold)
        CallbackFree(this.vtbl.Forward)
        CallbackFree(this.vtbl.Refer)
        CallbackFree(this.vtbl.put_ReferredByURI)
        CallbackFree(this.vtbl.get_ReferredByURI)
        CallbackFree(this.vtbl.put_ReferCookie)
        CallbackFree(this.vtbl.get_ReferCookie)
        CallbackFree(this.vtbl.get_IsReferred)
    }
}
