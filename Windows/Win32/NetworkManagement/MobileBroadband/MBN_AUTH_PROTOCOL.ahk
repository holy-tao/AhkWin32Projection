#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_AUTH_PROTOCOL enumerated type specifies the authentication protocol used for Packet Data Protocol (PDP) activation.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_auth_protocol
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
class MBN_AUTH_PROTOCOL extends Win32Enum {

    /**
     * No authentication protocol is used.
     * Native name: MBN_AUTH_PROTOCOL_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Password Authentication Protocol (PAP) is used for authentication. PAP authentication is unencrypted.
     * Native name: MBN_AUTH_PROTOCOL_PAP
     * @type {Integer (Int32)}
     */
    static PAP => 1

    /**
     * Challenge Handshake Authentication Protocol (CHAP) is used for authentication.
     * Native name: MBN_AUTH_PROTOCOL_CHAP
     * @type {Integer (Int32)}
     */
    static CHAP => 2

    /**
     * Microsoft Challenge-Handshake Authentication Protocol version 2.0 (MS-CHAP v2) is used for authentication.
     * Native name: MBN_AUTH_PROTOCOL_MSCHAPV2
     * @type {Integer (Int32)}
     */
    static MSCHAPV2 => 3
}
