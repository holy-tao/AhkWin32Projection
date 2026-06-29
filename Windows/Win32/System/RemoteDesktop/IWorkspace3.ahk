#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\IWorkspace2.ahk" { IWorkspace2 }

/**
 * Exposes methods that provide information about a connection in RemoteApp and Desktop Connection, and adds the ability to retrieve or set a claims token.
 * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nn-workspaceruntime-iworkspace3
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWorkspace3 extends IWorkspace2 {
    /**
     * The interface identifier for IWorkspace3
     * @type {Guid}
     */
    static IID := Guid("{1becbe4a-d654-423b-afeb-be8d532c13c6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWorkspace3 interfaces
    */
    struct Vtbl extends IWorkspace2.Vtbl {
        GetClaimsToken2 : IntPtr
        SetClaimsToken  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWorkspace3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a claims token.
     * @param {BSTR} bstrClaimsHint String containing the claims hint.
     * @param {BSTR} bstrUserHint String containing the user hint.
     * @param {Integer} claimCookie The claim cookie.
     * @param {Integer} hwndCredUiParent Handle of the parent UI element the request came from.
     * @param {RECT} rectCredUiParent Pointer to a RECT structure that contains the X and Y coordinates of the parent UI.
     * @returns {BSTR} On success, return a pointer to a string containing the access token.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspace3-getclaimstoken2
     */
    GetClaimsToken2(bstrClaimsHint, bstrUserHint, claimCookie, hwndCredUiParent, rectCredUiParent) {
        bstrClaimsHint := bstrClaimsHint is String ? BSTR.Alloc(bstrClaimsHint).Value : bstrClaimsHint
        bstrUserHint := bstrUserHint is String ? BSTR.Alloc(bstrUserHint).Value : bstrUserHint

        pbstrAccessToken := BSTR.Owned()
        result := ComCall(7, this, BSTR, bstrClaimsHint, BSTR, bstrUserHint, "uint", claimCookie, "uint", hwndCredUiParent, RECT, rectCredUiParent, BSTR.Ptr, pbstrAccessToken, "HRESULT")
        return pbstrAccessToken
    }

    /**
     * Sets the claims token.
     * @param {BSTR} bstrAccessToken A string containing the access token.
     * @param {Integer} ullAccessTokenExpiration The time, in milliseconds, until the access token expires.
     * @param {BSTR} bstrRefreshToken A string containing the refresh token.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspace3-setclaimstoken
     */
    SetClaimsToken(bstrAccessToken, ullAccessTokenExpiration, bstrRefreshToken) {
        bstrAccessToken := bstrAccessToken is String ? BSTR.Alloc(bstrAccessToken).Value : bstrAccessToken
        bstrRefreshToken := bstrRefreshToken is String ? BSTR.Alloc(bstrRefreshToken).Value : bstrRefreshToken

        result := ComCall(8, this, BSTR, bstrAccessToken, "uint", ullAccessTokenExpiration, BSTR, bstrRefreshToken, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWorkspace3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetClaimsToken2 := CallbackCreate(GetMethod(implObj, "GetClaimsToken2"), flags, 7)
        this.vtbl.SetClaimsToken := CallbackCreate(GetMethod(implObj, "SetClaimsToken"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetClaimsToken2)
        CallbackFree(this.vtbl.SetClaimsToken)
    }
}
