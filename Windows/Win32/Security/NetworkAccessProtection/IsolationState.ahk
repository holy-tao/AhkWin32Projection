#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the isolation state of a connection.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ne-naptypes-isolationstate
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 * @version v4.0.30319
 */
class IsolationState{

    /**
     * The connection isolation state is not restricted.
     * @type {Integer (Int32)}
     */
    static isolationStateNotRestricted => 1

    /**
     * The connection isolation state is probation.
     * @type {Integer (Int32)}
     */
    static isolationStateInProbation => 2

    /**
     * The connection isolation state is restricted access.
     * @type {Integer (Int32)}
     */
    static isolationStateRestrictedAccess => 3
}
