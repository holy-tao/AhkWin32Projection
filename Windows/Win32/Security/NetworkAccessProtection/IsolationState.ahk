#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the isolation state of a connection.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ne-naptypes-isolationstate
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 */
export default struct IsolationState {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
