#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the fix-up state of the System Health Agent (SHA).
 * @see https://docs.microsoft.com/windows/win32/api//naptypes/ne-naptypes-fixupstate
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 * @version v4.0.30319
 */
class FixupState{

    /**
     * SHA fix-up is successful.
     * @type {Integer (Int32)}
     */
    static fixupStateSuccess => 0

    /**
     * SHA fix-up in progress.
     * @type {Integer (Int32)}
     */
    static fixupStateInProgress => 1

    /**
     * SHA could not be updated.
     * @type {Integer (Int32)}
     */
    static fixupStateCouldNotUpdate => 2
}
