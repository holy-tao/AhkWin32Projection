#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * ISCSI_UNIQUE_SESSION_ID structure is an opaque entity that contains data that uniquely identifies a session.
 * @remarks
 * The <b>ISCSI_UNIQUE_CONNECTION_ID</b> is an alias for <b>ISCSI_UNIQUE_SESSION_ID</b>. The <b>ISCSI_UNIQUE_CONNECTION_ID</b> structure is an opaque entity that contains data that uniquely identifies a connection.
 * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/ns-iscsidsc-iscsi_unique_session_id
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct ISCSI_UNIQUE_SESSION_ID {
    #StructPack 8

    AdapterUnique : Int64

    AdapterSpecific : Int64

}
