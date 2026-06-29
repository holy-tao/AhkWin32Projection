#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the fix-up state of the System Health Agent (SHA).
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ne-naptypes-fixupstate
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 */
export default struct FixupState {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
