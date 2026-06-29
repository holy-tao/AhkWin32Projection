#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Deprecated. Used by IBrowserService::SetNavigateState and IBrowserService::GetNavigateState to specify navigation states.
 * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/ne-shdeprecated-bnstate
 * @namespace Windows.Win32.UI.Shell
 */
export default struct BNSTATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates the normal state.
     * @type {Integer (Int32)}
     */
    static BNS_NORMAL => 0

    /**
     * A begin navigation event has occurred.
     * @type {Integer (Int32)}
     */
    static BNS_BEGIN_NAVIGATE => 1

    /**
     * The navigation event has occurred.
     * @type {Integer (Int32)}
     */
    static BNS_NAVIGATE => 2
}
