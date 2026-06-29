#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * ISCSI_AUTH_TYPES enumeration indicates the type of authentication method utilized.
 * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/ne-iscsidsc-iscsi_auth_types
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct ISCSI_AUTH_TYPES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
