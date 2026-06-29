#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * TARGETPROTOCOLTYPE enumeration indicates the type of protocol that the initiator must use to communicate with the target.
 * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/ne-iscsidsc-targetprotocoltype
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct TARGETPROTOCOLTYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The target uses the TCP protocol.
     * @type {Integer (Int32)}
     */
    static ISCSI_TCP_PROTOCOL_TYPE => 0
}
