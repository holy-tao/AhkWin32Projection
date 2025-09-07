#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of IPsec security association (SA) context change event.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ne-ipsectypes-ipsec_sa_context_event_type0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_SA_CONTEXT_EVENT_TYPE0{

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
