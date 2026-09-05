#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of IPsec security association (SA) context change event.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ne-ipsectypes-ipsec_sa_context_event_type0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class IPSEC_SA_CONTEXT_EVENT_TYPE0 extends Win32Enum {

    /**
     * A new IPsec SA context was added.
     * Native name: IPSEC_SA_CONTEXT_EVENT_ADD
     * @type {Integer (Int32)}
     */
    static ADD => 1

    /**
     * An IPsec SA context was deleted.
     * Native name: IPSEC_SA_CONTEXT_EVENT_DELETE
     * @type {Integer (Int32)}
     */
    static DELETE => 2

    /**
     * Maximum value for testing purposes.
     * Native name: IPSEC_SA_CONTEXT_EVENT_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 3
}
