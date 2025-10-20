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
     * 
     * @param {Pointer} lCookie 
     * @returns {HRESULT} 
     */
    Hold(lCookie) {
        result := ComCall(3, this, "ptr", lCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} lCookie 
     * @returns {HRESULT} 
     */
    UnHold(lCookie) {
        result := ComCall(4, this, "ptr", lCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrForwardToURI 
     * @returns {HRESULT} 
     */
    Forward(bstrForwardToURI) {
        bstrForwardToURI := bstrForwardToURI is String ? BSTR.Alloc(bstrForwardToURI).Value : bstrForwardToURI

        result := ComCall(5, this, "ptr", bstrForwardToURI, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(6, this, "ptr", bstrReferToURI, "ptr", bstrReferCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrReferredByURI 
     * @returns {HRESULT} 
     */
    put_ReferredByURI(bstrReferredByURI) {
        bstrReferredByURI := bstrReferredByURI is String ? BSTR.Alloc(bstrReferredByURI).Value : bstrReferredByURI

        result := ComCall(7, this, "ptr", bstrReferredByURI, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrReferredByURI 
     * @returns {HRESULT} 
     */
    get_ReferredByURI(pbstrReferredByURI) {
        result := ComCall(8, this, "ptr", pbstrReferredByURI, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrReferCookie 
     * @returns {HRESULT} 
     */
    put_ReferCookie(bstrReferCookie) {
        bstrReferCookie := bstrReferCookie is String ? BSTR.Alloc(bstrReferCookie).Value : bstrReferCookie

        result := ComCall(9, this, "ptr", bstrReferCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrReferCookie 
     * @returns {HRESULT} 
     */
    get_ReferCookie(pbstrReferCookie) {
        result := ComCall(10, this, "ptr", pbstrReferCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfIsReferred 
     * @returns {HRESULT} 
     */
    get_IsReferred(pfIsReferred) {
        result := ComCall(11, this, "ptr", pfIsReferred, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
