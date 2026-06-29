#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITSGAuthenticateUserSink.ahk" { ITSGAuthenticateUserSink }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that authenticate users for Remote Desktop Gateway (RD Gateway).
 * @see https://learn.microsoft.com/windows/win32/api/tsgauthenticationengine/nn-tsgauthenticationengine-itsgauthenticationengine
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITSGAuthenticationEngine extends IUnknown {
    /**
     * The interface identifier for ITSGAuthenticationEngine
     * @type {Guid}
     */
    static IID := Guid("{9ee3e5bf-04ab-4691-998c-d7f622321a56}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITSGAuthenticationEngine interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AuthenticateUser     : IntPtr
        CancelAuthentication : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITSGAuthenticationEngine.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Authenticates a user.
     * @remarks
     * If this method returns <b>S_OK</b>, RD Gateway waits for the authentication 
     *     plug-in to call a method of the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/tsgauthenticationengine/nn-tsgauthenticationengine-itsgauthenticateusersink">ITSGAuthenticateUserSink</a> interface. If any 
     *     other value is returned, RD Gateway immediately denies the  connection request.
     * 
     * For a sample that uses the <b>AuthenticateUser</b> method, see the [Remote Desktop Gateway Pluggable Authentication and Authorization](https://github.com/microsoftarchive/msdn-code-gallery-community-m-r/tree/master/Remote%20Desktop%20Gateway%20Pluggable%20Authentication%20and%20Authorization%20Sample) sample.
     * @param {Guid} mainSessionId A unique identifier assigned to the connection request by RD Gateway.
     * @param {Pointer<Integer>} cookieData A pointer to a <b>BYTE</b> that contains the cookie provided by the user.
     * @param {Integer} numCookieBytes The number of bytes referenced by the <i>cookieData</i> parameter.
     * @param {Pointer} _context A pointer to  a <b>ULONG</b> that contains  a value specific to this connection. This 
     *       value should be passed back to RD Gateway by using the methods of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/tsgauthenticationengine/nn-tsgauthenticationengine-itsgauthenticateusersink">ITSGAuthenticateUserSink</a> interface.
     * @param {ITSGAuthenticateUserSink} pSink A pointer to a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/tsgauthenticationengine/nn-tsgauthenticationengine-itsgauthenticateusersink">ITSGAuthenticateUserSink</a> interface that 
     *       the authentication plug-in must use to notify RD Gateway about the result of authentication.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticationengine-authenticateuser
     */
    AuthenticateUser(mainSessionId, cookieData, numCookieBytes, _context, pSink) {
        cookieDataMarshal := cookieData is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, Guid, mainSessionId, cookieDataMarshal, cookieData, "uint", numCookieBytes, "ptr", _context, "ptr", pSink, "HRESULT")
        return result
    }

    /**
     * Cancels an existing authentication request.
     * @param {Guid} mainSessionId An identifier assigned to the connection request.
     * @param {Pointer} _context A pointer to  a <b>ULONG</b> that contains  a value that identifies this connection. This value should be passed back to RD Gateway by using the methods of the  <a href="https://docs.microsoft.com/windows/desktop/api/tsgauthenticationengine/nn-tsgauthenticationengine-itsgauthenticateusersink">ITSGAuthenticateUserSink</a> interface.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticationengine-cancelauthentication
     */
    CancelAuthentication(mainSessionId, _context) {
        result := ComCall(4, this, Guid, mainSessionId, "ptr", _context, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITSGAuthenticationEngine.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AuthenticateUser := CallbackCreate(GetMethod(implObj, "AuthenticateUser"), flags, 6)
        this.vtbl.CancelAuthentication := CallbackCreate(GetMethod(implObj, "CancelAuthentication"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AuthenticateUser)
        CallbackFree(this.vtbl.CancelAuthentication)
    }
}
