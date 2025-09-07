#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * ISCSI_UNIQUE_SESSION_ID structure is an opaque entity that contains data that uniquely identifies a session.
 * @remarks
 * The <b>ISCSI_UNIQUE_CONNECTION_ID</b> is an alias for <b>ISCSI_UNIQUE_SESSION_ID</b>. The <b>ISCSI_UNIQUE_CONNECTION_ID</b> structure is an opaque entity that contains data that uniquely identifies a connection.
 * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/ns-iscsidsc-iscsi_unique_session_id
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class ISCSI_UNIQUE_SESSION_ID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    AdapterUnique {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    AdapterSpecific {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
