#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of IPsec security association (SA) context change event.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ne-ipsectypes-ipsec_sa_context_event_type0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_SA_CONTEXT_EVENT_TYPE0 {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A new IPsec SA context was added.
     * @type {Integer (Int32)}
     */
    static IPSEC_SA_CONTEXT_EVENT_ADD => 1

    /**
     * An IPsec SA context was deleted.
     * @type {Integer (Int32)}
     */
    static IPSEC_SA_CONTEXT_EVENT_DELETE => 2

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static IPSEC_SA_CONTEXT_EVENT_MAX => 3
}
