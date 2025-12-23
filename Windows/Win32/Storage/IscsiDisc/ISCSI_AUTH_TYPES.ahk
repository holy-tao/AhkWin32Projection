#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * ISCSI_AUTH_TYPES enumeration indicates the type of authentication method utilized.
 * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/ne-iscsidsc-iscsi_auth_types
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class ISCSI_AUTH_TYPES extends Win32Enum{

    /**
     * No authentication type was specified.
     * @type {Integer (Int32)}
     */
    static ISCSI_NO_AUTH_TYPE => 0

    /**
     * Challenge Handshake Authentication Protocol (CHAP) authentication.
     * @type {Integer (Int32)}
     */
    static ISCSI_CHAP_AUTH_TYPE => 1

    /**
     * Mutual (2-way) CHAP authentication.
     * @type {Integer (Int32)}
     */
    static ISCSI_MUTUAL_CHAP_AUTH_TYPE => 2
}
