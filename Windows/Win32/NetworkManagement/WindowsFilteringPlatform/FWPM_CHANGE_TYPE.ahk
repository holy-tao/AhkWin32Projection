#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used when dispatching change notifications to subscribers.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ne-fwpmtypes-fwpm_change_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_CHANGE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies an add change notification.
     * @type {Integer (Int32)}
     */
    static FWPM_CHANGE_ADD => 1

    /**
     * Specifies a delete change notification.
     * @type {Integer (Int32)}
     */
    static FWPM_CHANGE_DELETE => 2

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static FWPM_CHANGE_TYPE_MAX => 3
}
