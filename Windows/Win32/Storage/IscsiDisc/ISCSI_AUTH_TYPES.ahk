#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * ISCSI_AUTH_TYPES enumeration indicates the type of authentication method utilized.
 * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/ne-iscsidsc-iscsi_auth_types
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
class ISCSI_AUTH_TYPES extends Win32Enum {

    /**
     * No authentication type was specified.
     * Native name: ISCSI_NO_AUTH_TYPE
     * @type {Integer (Int32)}
     */
    static NO_AUTH_TYPE => 0

    /**
     * Challenge Handshake Authentication Protocol (CHAP) authentication.
     * Native name: ISCSI_CHAP_AUTH_TYPE
     * @type {Integer (Int32)}
     */
    static CHAP_AUTH_TYPE => 1

    /**
     * Mutual (2-way) CHAP authentication.
     * Native name: ISCSI_MUTUAL_CHAP_AUTH_TYPE
     * @type {Integer (Int32)}
     */
    static MUTUAL_CHAP_AUTH_TYPE => 2
}
