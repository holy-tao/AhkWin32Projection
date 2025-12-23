#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Specifies the client details for every inbound request.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_sender_details
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_SENDER_DETAILS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Specifies the user name of the client making the request.  The content of this parameter varies depending on the type of authentication. The value of the <i>senderName</i> is formatted as follows:
     * 
     * <table>
     * <tr>
     * <th>Authentication mechanism</th>
     * <th>Value of <i>senderName</i></th>
     * </tr>
     * <tr>
     * <td>
     * Windows Authentication
     * 
     * </td>
     * <td>
     * The domain and user name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Basic Authentication
     * 
     * </td>
     * <td>
     * The user name specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Client Certificates
     * 
     * </td>
     * <td>
     * The subject of the certificate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * LiveID
     * 
     * </td>
     * <td>
     * The LiveID PUID as a string.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {PWSTR}
     */
    senderName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Specifies a string that indicates which authentication mechanism was used by the client.  The following values are predefined:
     * 
     * <ul>
     * <li>Basic</li>
     * <li>ClientCertificate</li>
     * </ul>
     * All other types are queried directly from the security package.  For Internet Information Services (IIS) hosting, this string is retrieved from the IIS infrastructure.
     * @type {PWSTR}
     */
    authenticationMechanism {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_certificate_details">WSMAN_CERTIFICATE_DETAILS</a> structure that specifies the details of the client's certificate. This parameter is valid only if the <i>authenticationMechanism</i> is set to ClientCertificate.
     * @type {Pointer<WSMAN_CERTIFICATE_DETAILS>}
     */
    certificateDetails {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies the identity token of the user if a Windows security token is available for a user. This token will be used by the thread to impersonate this user for all calls into the plug-in.
     * 
     * <div class="alert"><b>Note</b>  Authorization plug-ins can change the user context and use a different impersonation token.</div>
     * <div> </div>
     * @type {HANDLE}
     */
    clientToken{
        get {
            if(!this.HasProp("__clientToken"))
                this.__clientToken := HANDLE(24, this)
            return this.__clientToken
        }
    }

    /**
     * Specifies the HTTP URL of the inbound request.
     * @type {PWSTR}
     */
    httpURL {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
