#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EAPHOST_AUTH_STATUS.ahk" { EAPHOST_AUTH_STATUS }

/**
 * Describes current authentication information throughout different stages of the EAP authentication process.
 * @see https://learn.microsoft.com/windows/win32/api/eaphostpeertypes/ns-eaphostpeertypes-eaphost_auth_info
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EAPHOST_AUTH_INFO {
    #StructPack 4

    /**
     * An <a href="https://docs.microsoft.com/windows/win32/api/eaphostpeertypes/ne-eaphostpeertypes-eaphost_auth_status">EAPHOST_AUTH_STATUS</a> enumeration value that specifies the current status of the authentication session.
     */
    status : EAPHOST_AUTH_STATUS

    /**
     * An error value, either from winerror.h or elsewhere (Raserror.h), that indicates the last error raised during the authentication process.
     */
    dwErrorCode : UInt32

    /**
     * A reason code that specifies the reason the error in <b>dwErrorCode</b> was raised.
     */
    dwReasonCode : UInt32

}
