#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCSessionCallControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCSessionCallControl
     * @type {Guid}
     */
    static IID => Guid("{e9a50d94-190b-4f82-9530-3b8ebf60758a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Hold", "UnHold", "Forward", "Refer", "put_ReferredByURI", "get_ReferredByURI", "put_ReferCookie", "get_ReferCookie", "get_IsReferred"]

    /**
     * 
     * @param {Pointer} lCookie 
     * @returns {HRESULT} 
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

        result := ComCall(5, this, "ptr", bstrForwardToURI, "HRESULT")
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

        result := ComCall(6, this, "ptr", bstrReferToURI, "ptr", bstrReferCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrReferredByURI 
     * @returns {HRESULT} 
     */
    put_ReferredByURI(bstrReferredByURI) {
        bstrReferredByURI := bstrReferredByURI is String ? BSTR.Alloc(bstrReferredByURI).Value : bstrReferredByURI

        result := ComCall(7, this, "ptr", bstrReferredByURI, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ReferredByURI() {
        pbstrReferredByURI := BSTR()
        result := ComCall(8, this, "ptr", pbstrReferredByURI, "HRESULT")
        return pbstrReferredByURI
    }

    /**
     * 
     * @param {BSTR} bstrReferCookie 
     * @returns {HRESULT} 
     */
    put_ReferCookie(bstrReferCookie) {
        bstrReferCookie := bstrReferCookie is String ? BSTR.Alloc(bstrReferCookie).Value : bstrReferCookie

        result := ComCall(9, this, "ptr", bstrReferCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ReferCookie() {
        pbstrReferCookie := BSTR()
        result := ComCall(10, this, "ptr", pbstrReferCookie, "HRESULT")
        return pbstrReferCookie
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsReferred() {
        result := ComCall(11, this, "short*", &pfIsReferred := 0, "HRESULT")
        return pfIsReferred
    }
}
