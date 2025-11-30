#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * TARGETPROTOCOLTYPE enumeration indicates the type of protocol that the initiator must use to communicate with the target.
 * @see https://docs.microsoft.com/windows/win32/api//iscsidsc/ne-iscsidsc-targetprotocoltype
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class TARGETPROTOCOLTYPE extends Win32Enum{

    /**
     * The target uses the TCP protocol.
     * @type {Integer (Int32)}
     */
    static ISCSI_TCP_PROTOCOL_TYPE => 0
}
