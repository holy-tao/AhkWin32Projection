#Requires AutoHotkey v2.0.0 64-bit

/**
 * This resource represents the privilege level for a Diagnostic Data Query session
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/diagnosticdataquerytypes/ne-diagnosticdataquerytypes-ddqaccesslevel
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 * @version v4.0.30319
 */
class DdqAccessLevel{

    /**
     * No data can be accessed using this session.
     * @type {Integer (Int32)}
     */
    static NoData => 0

    /**
     * Only the current user's data can be accessed using this session.
     * @type {Integer (Int32)}
     */
    static CurrentUserData => 1

    /**
     * All User data can be accessed using this session.
     * @type {Integer (Int32)}
     */
    static AllUserData => 2
}
