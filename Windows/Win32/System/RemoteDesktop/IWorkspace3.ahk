#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWorkspace2.ahk

/**
 * Exposes methods that provide information about a connection in RemoteApp and Desktop Connection, and adds the ability to retrieve or set a claims token.
 * @see https://learn.microsoft.com/windows/win32/api//content/workspaceruntime/nn-workspaceruntime-iworkspace3
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWorkspace3 extends IWorkspace2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWorkspace3
     * @type {Guid}
     */
    static IID => Guid("{1becbe4a-d654-423b-afeb-be8d532c13c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetClaimsToken2", "SetClaimsToken"]

    /**
     * Retrieves a claims token.
     * @param {BSTR} bstrClaimsHint String containing the claims hint.
     * @param {BSTR} bstrUserHint String containing the user hint.
     * @param {Integer} claimCookie The claim cookie.
     * @param {Integer} hwndCredUiParent Handle of the parent UI element the request came from.
     * @param {RECT} rectCredUiParent Pointer to a RECT structure that contains the X and Y coordinates of the parent UI.
     * @returns {BSTR} On success, return a pointer to a string containing the access token.
     * @see https://learn.microsoft.com/windows/win32/api//content/workspaceruntime/nf-workspaceruntime-iworkspace3-getclaimstoken2
     */
    GetClaimsToken2(bstrClaimsHint, bstrUserHint, claimCookie, hwndCredUiParent, rectCredUiParent) {
        if(bstrClaimsHint is String) {
            pin := BSTR.Alloc(bstrClaimsHint)
            bstrClaimsHint := pin.Value
        }
        if(bstrUserHint is String) {
            pin := BSTR.Alloc(bstrUserHint)
            bstrUserHint := pin.Value
        }

        pbstrAccessToken := BSTR()
        result := ComCall(7, this, "ptr", bstrClaimsHint, "ptr", bstrUserHint, "uint", claimCookie, "uint", hwndCredUiParent, "ptr", rectCredUiParent, "ptr", pbstrAccessToken, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrAccessToken
    }

    /**
     * Sets the claims token.
     * @param {BSTR} bstrAccessToken A string containing the access token.
     * @param {Integer} ullAccessTokenExpiration The time, in milliseconds, until the access token expires.
     * @param {BSTR} bstrRefreshToken A string containing the refresh token.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/workspaceruntime/nf-workspaceruntime-iworkspace3-setclaimstoken
     */
    SetClaimsToken(bstrAccessToken, ullAccessTokenExpiration, bstrRefreshToken) {
        if(bstrAccessToken is String) {
            pin := BSTR.Alloc(bstrAccessToken)
            bstrAccessToken := pin.Value
        }
        if(bstrRefreshToken is String) {
            pin := BSTR.Alloc(bstrRefreshToken)
            bstrRefreshToken := pin.Value
        }

        result := ComCall(8, this, "ptr", bstrAccessToken, "uint", ullAccessTokenExpiration, "ptr", bstrRefreshToken, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
