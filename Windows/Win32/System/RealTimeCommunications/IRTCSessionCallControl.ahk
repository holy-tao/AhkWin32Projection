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
     * @see https://learn.microsoft.com/windows/win32/api//content/iads/nn-iads-iadshold
     */
    Hold(lCookie) {
        result := ComCall(3, this, "ptr", lCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer} lCookie 
     * @returns {HRESULT} 
     */
    UnHold(lCookie) {
        result := ComCall(4, this, "ptr", lCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrForwardToURI 
     * @returns {HRESULT} 
     */
    Forward(bstrForwardToURI) {
        if(bstrForwardToURI is String) {
            pin := BSTR.Alloc(bstrForwardToURI)
            bstrForwardToURI := pin.Value
        }

        result := ComCall(5, this, "ptr", bstrForwardToURI, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Learn about references you can use to create and configure Always On availability groups for SQL Server.
     * @param {BSTR} bstrReferToURI 
     * @param {BSTR} bstrReferCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/database-engine/availability-groups/windows/creation-and-configuration-of-availability-groups-sql-server
     */
    Refer(bstrReferToURI, bstrReferCookie) {
        if(bstrReferToURI is String) {
            pin := BSTR.Alloc(bstrReferToURI)
            bstrReferToURI := pin.Value
        }
        if(bstrReferCookie is String) {
            pin := BSTR.Alloc(bstrReferCookie)
            bstrReferCookie := pin.Value
        }

        result := ComCall(6, this, "ptr", bstrReferToURI, "ptr", bstrReferCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrReferredByURI 
     * @returns {HRESULT} 
     */
    put_ReferredByURI(bstrReferredByURI) {
        if(bstrReferredByURI is String) {
            pin := BSTR.Alloc(bstrReferredByURI)
            bstrReferredByURI := pin.Value
        }

        result := ComCall(7, this, "ptr", bstrReferredByURI, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ReferredByURI() {
        pbstrReferredByURI := BSTR()
        result := ComCall(8, this, "ptr", pbstrReferredByURI, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrReferredByURI
    }

    /**
     * 
     * @param {BSTR} bstrReferCookie 
     * @returns {HRESULT} 
     */
    put_ReferCookie(bstrReferCookie) {
        if(bstrReferCookie is String) {
            pin := BSTR.Alloc(bstrReferCookie)
            bstrReferCookie := pin.Value
        }

        result := ComCall(9, this, "ptr", bstrReferCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ReferCookie() {
        pbstrReferCookie := BSTR()
        result := ComCall(10, this, "ptr", pbstrReferCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrReferCookie
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsReferred() {
        result := ComCall(11, this, "short*", &pfIsReferred := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfIsReferred
    }
}
