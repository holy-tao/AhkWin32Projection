#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * This resource represents the privilege level for a Diagnostic Data Query session
 * @see https://learn.microsoft.com/windows/win32/api/diagnosticdataquerytypes/ne-diagnosticdataquerytypes-ddqaccesslevel
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 */
class DdqAccessLevel extends Win32Enum {

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
