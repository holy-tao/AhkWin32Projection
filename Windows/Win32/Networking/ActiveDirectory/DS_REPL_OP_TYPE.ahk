#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used to indicate the type of replication operation that a given entry in the replication queue represents.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ne-ntdsapi-ds_repl_op_type
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DS_REPL_OP_TYPE{

    /**
     * Indicates an inbound replication over an existing replication agreement from a direct replication partner.
     * @type {Integer (Int32)}
     */
    static DS_REPL_OP_TYPE_SYNC => 0

    /**
     * Indicates the addition of a replication agreement for a new direct replication partner.
     * @type {Integer (Int32)}
     */
    static DS_REPL_OP_TYPE_ADD => 1

    /**
     * Indicates the removal of a replication agreement for an existing direct replication partner.
     * @type {Integer (Int32)}
     */
    static DS_REPL_OP_TYPE_DELETE => 2

    /**
     * Indicates the modification of a replication agreement for an existing direct replication partner.
     * @type {Integer (Int32)}
     */
    static DS_REPL_OP_TYPE_MODIFY => 3

    /**
     * Indicates the addition, deletion, or update of outbound change notification data for a direct replication partner.
     * @type {Integer (Int32)}
     */
    static DS_REPL_OP_TYPE_UPDATE_REFS => 4
}
