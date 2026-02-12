#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The WebDAV client calls the application-defined DavAuthCallback callback function to prompt the user for credentials.
 * @remarks
 * The <i>DavAuthCallback</i> callback function must be registered by calling the <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/nf-davclnt-davregisterauthcallback">DavRegisterAuthCallback</a> function.
 * 
 * To unregister this callback function, use the <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/nf-davclnt-davunregisterauthcallback">DavUnregisterAuthCallback</a> function.
 * 
 * This callback function should prompt the user for credentials (either a <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/ns-davclnt-dav_callback_auth_unp">user name and password</a> or an <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/ns-davclnt-dav_callback_auth_blob">authentication BLOB</a>) and store this information in the appropriate member of the <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/ns-davclnt-dav_callback_cred">DAV_CALLBACK_CRED</a> structure that the <i>pCallbackCred</i> parameter points to.
 * @see https://learn.microsoft.com/windows/win32/api//content/davclnt/nc-davclnt-pfndavauthcallback
 * @namespace Windows.Win32.NetworkManagement.WebDav
 * @version v4.0.30319
 */
class PFNDAVAUTHCALLBACK extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {PWSTR} lpwzServerName 
     * @param {PWSTR} lpwzRemoteName 
     * @param {Integer} dwAuthScheme 
     * @param {Integer} dwFlags 
     * @param {Pointer<DAV_CALLBACK_CRED>} pCallbackCred 
     * @param {Pointer<Integer>} NextStep 
     * @param {Pointer<Pointer<PFNDAVAUTHCALLBACK_FREECRED>>} pFreeCred 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lpwzServerName, lpwzRemoteName, dwAuthScheme, dwFlags, pCallbackCred, NextStep, pFreeCred) {
        lpwzServerName := lpwzServerName is String ? StrPtr(lpwzServerName) : lpwzServerName
        lpwzRemoteName := lpwzRemoteName is String ? StrPtr(lpwzRemoteName) : lpwzRemoteName

        NextStepMarshal := NextStep is VarRef ? "int*" : "ptr"
        pFreeCredMarshal := pFreeCred is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", lpwzServerName, "ptr", lpwzRemoteName, "uint", dwAuthScheme, "uint", dwFlags, "ptr", pCallbackCred, NextStepMarshal, NextStep, pFreeCredMarshal, pFreeCred, "uint")
        return result
    }
}
