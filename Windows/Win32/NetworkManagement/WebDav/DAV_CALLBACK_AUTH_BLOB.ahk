#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores an authentication BLOB that was retrieved by the DavAuthCallback callback function.
 * @remarks
 * 
 * This structure is included as a member in the <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/ns-davclnt-dav_callback_cred">DAV_CALLBACK_CRED</a> structure.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/nc-davclnt-pfndavauthcallback_freecred">DavFreeCredCallback</a> callback function should free only the buffer that the <b>pBuffer</b> member points to, not the entire structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//davclnt/ns-davclnt-dav_callback_auth_blob
 * @namespace Windows.Win32.NetworkManagement.WebDav
 * @version v4.0.30319
 */
class DAV_CALLBACK_AUTH_BLOB extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to a buffer that receives the authentication <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a>.
     * @type {Pointer<Void>}
     */
    pBuffer {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The size, in bytes, of the buffer that the <b>pBuffer</b> member points to.
     * @type {Integer}
     */
    ulSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The data type of the buffer that the <b>pBuffer</b> member points to.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * PCCERT_CONTEXT
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ulType {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
