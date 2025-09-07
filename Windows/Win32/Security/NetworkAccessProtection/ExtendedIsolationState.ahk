#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the extended isolation state of a connection.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ne-naptypes-extendedisolationstate
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 * @version v4.0.30319
 */
class ExtendedIsolationState{

    /**
     * No data is available on the connection isolation state.
     * @type {Integer (Int32)}
     */
    static extendedIsolationStateNoData => 0

    /**
     * The connection isolation state is "transition".
     * @type {Integer (Int32)}
     */
    static extendedIsolationStateTransition => 1

    /**
     * The connection isolation state is "infected".
     * @type {Integer (Int32)}
     */
    static extendedIsolationStateInfected => 2

    /**
     * The connection isolation state is unknown.
     * @type {Integer (Int32)}
     */
    static extendedIsolationStateUnknown => 3
}
