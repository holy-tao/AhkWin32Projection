#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DAV_CALLBACK_AUTH_BLOB.ahk" { DAV_CALLBACK_AUTH_BLOB }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DAV_CALLBACK_AUTH_UNP.ahk" { DAV_CALLBACK_AUTH_UNP }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Stores user credential information that was retrieved by the DavAuthCallback callback function.
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/nc-davclnt-pfndavauthcallback">DavAuthCallback</a> callback function.
 * @see https://learn.microsoft.com/windows/win32/api/davclnt/ns-davclnt-dav_callback_cred
 * @namespace Windows.Win32.NetworkManagement.WebDav
 */
export default struct DAV_CALLBACK_CRED {
    #StructPack 8

    /**
     * If the <b>bAuthBlobValid</b> member is <b>TRUE</b>, this member is a <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/ns-davclnt-dav_callback_auth_blob">DAV_CALLBACK_AUTH_BLOB</a> structure that contains the user credential information.
     */
    AuthBlob : DAV_CALLBACK_AUTH_BLOB

    /**
     * If the <b>bAuthBlobValid</b> member is <b>FALSE</b>, this member is a <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/ns-davclnt-dav_callback_auth_unp">DAV_CALLBACK_AUTH_UNP</a> structure that contains the user credential information.
     */
    UNPBlob : DAV_CALLBACK_AUTH_UNP

    /**
     * <b>TRUE</b> if the credential information is stored in the <b>AuthBlob</b> member, and the <b>UNPBlob</b> member should be ignored. <b>FALSE</b> if it is stored in the <b>UNPBlob</b> member, and the <b>AuthBlob</b> member should be ignored.
     */
    bAuthBlobValid : BOOL

    /**
     * <b>TRUE</b> if the credential information was written to the <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/credential-manager">credential manager</a>, or <b>FALSE</b> otherwise.
     */
    bSave : BOOL

}
