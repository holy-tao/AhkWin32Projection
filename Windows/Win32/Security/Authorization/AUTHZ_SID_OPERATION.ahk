#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the type of SID operations that can be made by a call to the AuthzModifySids function.
 * @see https://learn.microsoft.com/windows/win32/api/authz/ne-authz-authz_sid_operation
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class AUTHZ_SID_OPERATION{

    /**
     * Do not modify anything.
     * @type {Integer (Int32)}
     */
    static AUTHZ_SID_OPERATION_NONE => 0

    /**
     * Deletes all existing SIDs and replaces them with the specified SIDs. If the replacement SIDs are not specified, all existing SIDs are deleted. This operation can be specified only once and must be the only operation specified.
     * @type {Integer (Int32)}
     */
    static AUTHZ_SID_OPERATION_REPLACE_ALL => 1

    /**
     * Adds a new SID. If the SID already exists, the call fails.
     * @type {Integer (Int32)}
     */
    static AUTHZ_SID_OPERATION_ADD => 2

    /**
     * Deletes the specified SID. If no matching SID is found, no modifications are done and the call fails.
     * @type {Integer (Int32)}
     */
    static AUTHZ_SID_OPERATION_DELETE => 3

    /**
     * Replaces the existing SID with the specified SID. If the SID does not already exist, then adds the SID.
     * @type {Integer (Int32)}
     */
    static AUTHZ_SID_OPERATION_REPLACE => 4
}
