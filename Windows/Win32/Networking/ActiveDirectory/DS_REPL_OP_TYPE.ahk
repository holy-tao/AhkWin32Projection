#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used to indicate the type of replication operation that a given entry in the replication queue represents.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ne-ntdsapi-ds_repl_op_type
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
class DS_REPL_OP_TYPE extends Win32Enum {

    /**
     * Indicates an inbound replication over an existing replication agreement from a direct replication partner.
     * Native name: DS_REPL_OP_TYPE_SYNC
     * @type {Integer (Int32)}
     */
    static SYNC => 0

    /**
     * Indicates the addition of a replication agreement for a new direct replication partner.
     * Native name: DS_REPL_OP_TYPE_ADD
     * @type {Integer (Int32)}
     */
    static ADD => 1

    /**
     * Indicates the removal of a replication agreement for an existing direct replication partner.
     * Native name: DS_REPL_OP_TYPE_DELETE
     * @type {Integer (Int32)}
     */
    static DELETE => 2

    /**
     * Indicates the modification of a replication agreement for an existing direct replication partner.
     * Native name: DS_REPL_OP_TYPE_MODIFY
     * @type {Integer (Int32)}
     */
    static MODIFY => 3

    /**
     * Indicates the addition, deletion, or update of outbound change notification data for a direct replication partner.
     * Native name: DS_REPL_OP_TYPE_UPDATE_REFS
     * @type {Integer (Int32)}
     */
    static UPDATE_REFS => 4
}
