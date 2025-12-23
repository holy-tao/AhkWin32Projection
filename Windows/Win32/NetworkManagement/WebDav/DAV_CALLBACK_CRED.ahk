#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DAV_CALLBACK_AUTH_BLOB.ahk
#Include .\DAV_CALLBACK_AUTH_UNP.ahk

/**
 * Stores user credential information that was retrieved by the DavAuthCallback callback function.
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/nc-davclnt-pfndavauthcallback">DavAuthCallback</a> callback function.
 * @see https://learn.microsoft.com/windows/win32/api/davclnt/ns-davclnt-dav_callback_cred
 * @namespace Windows.Win32.NetworkManagement.WebDav
 * @version v4.0.30319
 */
class DAV_CALLBACK_CRED extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * If the <b>bAuthBlobValid</b> member is <b>TRUE</b>, this member is a <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/ns-davclnt-dav_callback_auth_blob">DAV_CALLBACK_AUTH_BLOB</a> structure that contains the user credential information.
     * @type {DAV_CALLBACK_AUTH_BLOB}
     */
    AuthBlob{
        get {
            if(!this.HasProp("__AuthBlob"))
                this.__AuthBlob := DAV_CALLBACK_AUTH_BLOB(0, this)
            return this.__AuthBlob
        }
    }

    /**
     * If the <b>bAuthBlobValid</b> member is <b>FALSE</b>, this member is a <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/ns-davclnt-dav_callback_auth_unp">DAV_CALLBACK_AUTH_UNP</a> structure that contains the user credential information.
     * @type {DAV_CALLBACK_AUTH_UNP}
     */
    UNPBlob{
        get {
            if(!this.HasProp("__UNPBlob"))
                this.__UNPBlob := DAV_CALLBACK_AUTH_UNP(16, this)
            return this.__UNPBlob
        }
    }

    /**
     * <b>TRUE</b> if the credential information is stored in the <b>AuthBlob</b> member, and the <b>UNPBlob</b> member should be ignored. <b>FALSE</b> if it is stored in the <b>UNPBlob</b> member, and the <b>AuthBlob</b> member should be ignored.
     * @type {BOOL}
     */
    bAuthBlobValid {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * <b>TRUE</b> if the credential information was written to the <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/credential-manager">credential manager</a>, or <b>FALSE</b> otherwise.
     * @type {BOOL}
     */
    bSave {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }
}
