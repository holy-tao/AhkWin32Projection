#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the isolation state of a connection.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ne-naptypes-isolationstate
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 */
class IsolationState extends Win32Enum {

    /**
     * The connection isolation state is not restricted.
     * Native name: isolationStateNotRestricted
     * @type {Integer (Int32)}
     */
    static NotRestricted => 1

    /**
     * The connection isolation state is probation.
     * Native name: isolationStateInProbation
     * @type {Integer (Int32)}
     */
    static InProbation => 2

    /**
     * The connection isolation state is restricted access.
     * Native name: isolationStateRestrictedAccess
     * @type {Integer (Int32)}
     */
    static RestrictedAccess => 3
}
