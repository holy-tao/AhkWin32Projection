#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MBN_AUTH_PROTOCOL enumerated type specifies the authentication protocol used for Packet Data Protocol (PDP) activation.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_auth_protocol
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_AUTH_PROTOCOL{

    /**
     * No authentication protocol is used.
     * @type {Integer (Int32)}
     */
    static MBN_AUTH_PROTOCOL_NONE => 0

    /**
     * Password Authentication Protocol (PAP) is used for authentication. PAP authentication is unencrypted.
     * @type {Integer (Int32)}
     */
    static MBN_AUTH_PROTOCOL_PAP => 1

    /**
     * Challenge Handshake Authentication Protocol (CHAP) is used for authentication.
     * @type {Integer (Int32)}
     */
    static MBN_AUTH_PROTOCOL_CHAP => 2

    /**
     * Microsoft Challenge-Handshake Authentication Protocol version 2.0 (MS-CHAP v2) is used for authentication.
     * @type {Integer (Int32)}
     */
    static MBN_AUTH_PROTOCOL_MSCHAPV2 => 3
}
