#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the type of SID operations that can be made by a call to the AuthzModifySids function.
 * @see https://learn.microsoft.com/windows/win32/api/authz/ne-authz-authz_sid_operation
 * @namespace Windows.Win32.Security.Authorization
 */
class AUTHZ_SID_OPERATION extends Win32Enum {

    /**
     * Do not modify anything.
     * Native name: AUTHZ_SID_OPERATION_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Deletes all existing SIDs and replaces them with the specified SIDs. If the replacement SIDs are not specified, all existing SIDs are deleted. This operation can be specified only once and must be the only operation specified.
     * Native name: AUTHZ_SID_OPERATION_REPLACE_ALL
     * @type {Integer (Int32)}
     */
    static REPLACE_ALL => 1

    /**
     * Adds a new SID. If the SID already exists, the call fails.
     * Native name: AUTHZ_SID_OPERATION_ADD
     * @type {Integer (Int32)}
     */
    static ADD => 2

    /**
     * Deletes the specified SID. If no matching SID is found, no modifications are done and the call fails.
     * Native name: AUTHZ_SID_OPERATION_DELETE
     * @type {Integer (Int32)}
     */
    static DELETE => 3

    /**
     * Replaces the existing SID with the specified SID. If the SID does not already exist, then adds the SID.
     * Native name: AUTHZ_SID_OPERATION_REPLACE
     * @type {Integer (Int32)}
     */
    static REPLACE => 4
}
