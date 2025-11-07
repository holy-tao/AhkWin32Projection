#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the variety of updates that should be returned by the search:\_per-machine updates, per-user updates, or both.
 * @remarks
 * 
 * In versions of the Windows Update Agent that do not support per-user updates (versions that do not support the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher3">IUpdateSearcher3</a> interface), searches will always return only per-machine updates.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/ne-wuapi-searchscope
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class SearchScope{

    /**
     * Search by using the default scope (the scope that Automatic Updates would use when searching for updates). This is currently equivalent to search ScopeMachineOnly.
     * @type {Integer (Int32)}
     */
    static searchScopeDefault => 0

    /**
     * Search only for per-machine updates; exclude all per-user updates.
     * @type {Integer (Int32)}
     */
    static searchScopeMachineOnly => 1

    /**
     * Search only for per-user updates applicable to the calling user – the user who owns the process which is making the Windows Update Agent (WUA) API call.
     * @type {Integer (Int32)}
     */
    static searchScopeCurrentUserOnly => 2

    /**
     * [Not currently supported.] Search for per-machine updates and for per-user updates applicable to the current user.
     * @type {Integer (Int32)}
     */
    static searchScopeMachineAndCurrentUser => 3

    /**
     * [Not currently supported.] Search  for per-machine updates and for per-user updates applicable to any known user accounts on the computer.
     * @type {Integer (Int32)}
     */
    static searchScopeMachineAndAllUsers => 4

    /**
     * [Not currently supported.] Search only for per-user updates applicable to any known user accounts on the computer.
     * @type {Integer (Int32)}
     */
    static searchScopeAllUsers => 5
}
