#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWorkspace2.ahk

/**
 * Exposes methods that provide information about a connection in RemoteApp and Desktop Connection, and adds the ability to retrieve or set a claims token.
 * @see https://docs.microsoft.com/windows/win32/api//workspaceruntime/nn-workspaceruntime-iworkspace3
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
     * 
     * @param {BSTR} bstrClaimsHint 
     * @param {BSTR} bstrUserHint 
     * @param {Integer} claimCookie 
     * @param {Integer} hwndCredUiParent 
     * @param {RECT} rectCredUiParent 
     * @param {Pointer<BSTR>} pbstrAccessToken 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspace3-getclaimstoken2
     */
    GetClaimsToken2(bstrClaimsHint, bstrUserHint, claimCookie, hwndCredUiParent, rectCredUiParent, pbstrAccessToken) {
        bstrClaimsHint := bstrClaimsHint is String ? BSTR.Alloc(bstrClaimsHint).Value : bstrClaimsHint
        bstrUserHint := bstrUserHint is String ? BSTR.Alloc(bstrUserHint).Value : bstrUserHint

        result := ComCall(7, this, "ptr", bstrClaimsHint, "ptr", bstrUserHint, "uint", claimCookie, "uint", hwndCredUiParent, "ptr", rectCredUiParent, "ptr", pbstrAccessToken, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrAccessToken 
     * @param {Integer} ullAccessTokenExpiration 
     * @param {BSTR} bstrRefreshToken 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspace3-setclaimstoken
     */
    SetClaimsToken(bstrAccessToken, ullAccessTokenExpiration, bstrRefreshToken) {
        bstrAccessToken := bstrAccessToken is String ? BSTR.Alloc(bstrAccessToken).Value : bstrAccessToken
        bstrRefreshToken := bstrRefreshToken is String ? BSTR.Alloc(bstrRefreshToken).Value : bstrRefreshToken

        result := ComCall(8, this, "ptr", bstrAccessToken, "uint", ullAccessTokenExpiration, "ptr", bstrRefreshToken, "HRESULT")
        return result
    }
}
