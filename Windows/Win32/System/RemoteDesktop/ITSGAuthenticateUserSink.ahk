#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\HANDLE_PTR.ahk" { HANDLE_PTR }

/**
 * Exposes methods that notify Remote Desktop Gateway (RD Gateway) about authentication events.
 * @see https://learn.microsoft.com/windows/win32/api/tsgauthenticationengine/nn-tsgauthenticationengine-itsgauthenticateusersink
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITSGAuthenticateUserSink extends IUnknown {
    /**
     * The interface identifier for ITSGAuthenticateUserSink
     * @type {Guid}
     */
    static IID := Guid("{2c3e2e73-a782-47f9-8dfb-77ee1ed27a03}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITSGAuthenticateUserSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnUserAuthenticated        : IntPtr
        OnUserAuthenticationFailed : IntPtr
        ReauthenticateUser         : IntPtr
        DisconnectUser             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITSGAuthenticateUserSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies Remote Desktop Gateway (RD Gateway) that the authentication plug-in has successfully authenticated the user.
     * @remarks
     * You can call this method from your implementation of <a href="https://docs.microsoft.com/windows/desktop/api/tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticationengine-authenticateuser">AuthenticateUser</a>. If authentication requires more than 1 second, we recommend launching a separate thread to perform authentication.
     * 
     * For a sample that uses the <b>OnUserAuthenticated</b> method, see the [Remote Desktop Gateway Pluggable Authentication and Authorization](https://github.com/microsoftarchive/msdn-code-gallery-community-m-r/tree/master/Remote%20Desktop%20Gateway%20Pluggable%20Authentication%20and%20Authorization%20Sample) sample.
     * @param {BSTR} userName The name of the user who initiated the connection.
     * @param {BSTR} userDomain The domain of the user who initiated the connection.
     * @param {Pointer} _context A pointer to  a <b>ULONG</b> that contains  a value that identifies this connection. Use the value that was passed by the <a href="https://docs.microsoft.com/windows/desktop/api/tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticationengine-authenticateuser">AuthenticateUser</a> method.
     * @param {HANDLE_PTR} userToken A pointer to a <b>HANDLE</b> that specifies the user token of the user. If the user is not running Windows, set this parameter to <b>NULL</b>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticateusersink-onuserauthenticated
     */
    OnUserAuthenticated(userName, userDomain, _context, userToken) {
        userName := userName is String ? BSTR.Alloc(userName).Value : userName
        userDomain := userDomain is String ? BSTR.Alloc(userDomain).Value : userDomain

        result := ComCall(3, this, BSTR, userName, BSTR, userDomain, "ptr", _context, HANDLE_PTR, userToken, "HRESULT")
        return result
    }

    /**
     * Notifies Remote Desktop Gateway (RD Gateway) that the authentication plug-in failed to authenticate the user.
     * @remarks
     * You can call this method from your implementation of 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticationengine-authenticateuser">AuthenticateUser</a>. If 
     *     authentication requires more than 1 second, we recommend launching a separate thread to perform 
     *     authentication.
     * 
     * For a sample that uses the <b>OnUserAuthenticationFailed</b> method, see the [Remote Desktop Gateway Pluggable Authentication and Authorization](https://github.com/microsoftarchive/msdn-code-gallery-community-m-r/tree/master/Remote%20Desktop%20Gateway%20Pluggable%20Authentication%20and%20Authorization%20Sample) sample.
     * @param {Pointer} _context A pointer to  a <b>ULONG</b> that contains  a value that identifies this connection. Use the value that was passed by the <a href="https://docs.microsoft.com/windows/desktop/api/tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticationengine-authenticateuser">AuthenticateUser</a> method.
     * @param {HRESULT} genericErrorCode A Windows error code that specifies the cause of the authentication failure.
     * @param {HRESULT} specificErrorCode This parameter is reserved. Always set this parameter to zero.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticateusersink-onuserauthenticationfailed
     */
    OnUserAuthenticationFailed(_context, genericErrorCode, specificErrorCode) {
        result := ComCall(4, this, "ptr", _context, "int", genericErrorCode, "int", specificErrorCode, "HRESULT")
        return result
    }

    /**
     * Notifies Remote Desktop Gateway (RD Gateway) that it should silently reauthenticate and reauthorize the user.
     * @remarks
     * When this method is called, RD Gateway silently attempts to reauthenticate and reauthorize the 
     *     user. If the attempt fails, it disconnects the user. The authentication plug-in can use this method to 
     *     periodically reauthenticate the user as needed.
     * 
     * 
     * For a sample that uses the <b>ReauthenticateUser</b> method, see the [Remote Desktop Gateway Pluggable Authentication and Authorization](https://github.com/microsoftarchive/msdn-code-gallery-community-m-r/tree/master/Remote%20Desktop%20Gateway%20Pluggable%20Authentication%20and%20Authorization%20Sample) sample.
     * @param {Pointer} _context A pointer to  a <b>ULONG</b> that contains  a value specific to this connection. Use 
     *        the value that was passed by the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticationengine-authenticateuser">AuthenticateUser</a> 
     *        method.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticateusersink-reauthenticateuser
     */
    ReauthenticateUser(_context) {
        result := ComCall(5, this, "ptr", _context, "HRESULT")
        return result
    }

    /**
     * Notifies Remote Desktop Gateway (RD Gateway) that it should disconnect the client.
     * @remarks
     * The authentication plug-in can use this method to disconnect the client as needed. For example, it can call this method if the client's cookie expires.
     * @param {Pointer} _context A pointer to  a <b>ULONG</b> that contains  a value that identifies the connection to disconnect. Use the value that was passed by the <a href="https://docs.microsoft.com/windows/desktop/api/tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticationengine-authenticateuser">AuthenticateUser</a> method.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticateusersink-disconnectuser
     */
    DisconnectUser(_context) {
        result := ComCall(6, this, "ptr", _context, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITSGAuthenticateUserSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnUserAuthenticated := CallbackCreate(GetMethod(implObj, "OnUserAuthenticated"), flags, 5)
        this.vtbl.OnUserAuthenticationFailed := CallbackCreate(GetMethod(implObj, "OnUserAuthenticationFailed"), flags, 4)
        this.vtbl.ReauthenticateUser := CallbackCreate(GetMethod(implObj, "ReauthenticateUser"), flags, 2)
        this.vtbl.DisconnectUser := CallbackCreate(GetMethod(implObj, "DisconnectUser"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnUserAuthenticated)
        CallbackFree(this.vtbl.OnUserAuthenticationFailed)
        CallbackFree(this.vtbl.ReauthenticateUser)
        CallbackFree(this.vtbl.DisconnectUser)
    }
}
