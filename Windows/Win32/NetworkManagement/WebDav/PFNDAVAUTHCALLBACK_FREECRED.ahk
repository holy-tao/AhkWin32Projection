#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The WebDAV client calls the application-defined DavFreeCredCallback callback function to free the credential information that was retrieved by the DavAuthCallback callback function.
 * @remarks
 * The <i>DavFreeCredCallback</i> callback function must be registered by calling the <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/nf-davclnt-davregisterauthcallback">DavRegisterAuthCallback</a> function.
 * 
 * This callback function should free only the buffer that the <b>pBuffer</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/ns-davclnt-dav_callback_auth_unp">DAV_CALLBACK_AUTH_UNP</a> or <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/ns-davclnt-dav_callback_auth_blob">DAV_CALLBACK_AUTH_BLOB</a> structure points to, not the entire structure.
 * @see https://learn.microsoft.com/windows/win32/api//content/davclnt/nc-davclnt-pfndavauthcallback_freecred
 * @namespace Windows.Win32.NetworkManagement.WebDav
 * @version v4.0.30319
 */
class PFNDAVAUTHCALLBACK_FREECRED extends IUnknown {

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
     * @param {Pointer<Void>} pbuffer 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pbuffer) {
        pbufferMarshal := pbuffer is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pbufferMarshal, pbuffer, "uint")
        return result
    }
}
