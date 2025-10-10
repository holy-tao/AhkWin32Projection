#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes current authentication information throughout different stages of the EAP authentication process.
 * @see https://docs.microsoft.com/windows/win32/api//eaphostpeertypes/ns-eaphostpeertypes-eaphost_auth_info
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EAPHOST_AUTH_INFO extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * An <a href="https://docs.microsoft.com/windows/win32/api/eaphostpeertypes/ne-eaphostpeertypes-eaphost_auth_status">EAPHOST_AUTH_STATUS</a> enumeration value that specifies the current status of the authentication session.
     * @type {Integer}
     */
    status {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * An error value, either from winerror.h or elsewhere (Raserror.h), that indicates the last error raised during the authentication process.
     * @type {Integer}
     */
    dwErrorCode {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A reason code that specifies the reason the error in <b>dwErrorCode</b> was raised.
     * @type {Integer}
     */
    dwReasonCode {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
