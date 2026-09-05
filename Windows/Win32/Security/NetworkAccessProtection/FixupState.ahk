#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the fix-up state of the System Health Agent (SHA).
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ne-naptypes-fixupstate
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 */
class FixupState extends Win32Enum {

    /**
     * SHA fix-up is successful.
     * Native name: fixupStateSuccess
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * SHA fix-up in progress.
     * Native name: fixupStateInProgress
     * @type {Integer (Int32)}
     */
    static InProgress => 1

    /**
     * SHA could not be updated.
     * Native name: fixupStateCouldNotUpdate
     * @type {Integer (Int32)}
     */
    static CouldNotUpdate => 2
}
