#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Type of net event.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ne-fwpmtypes-fwpm_net_event_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class FWPM_NET_EVENT_TYPE extends Win32Enum {

    /**
     * An IKE/AuthIP main mode failure has occurred.
     * Native name: FWPM_NET_EVENT_TYPE_IKEEXT_MM_FAILURE
     * @type {Integer (Int32)}
     */
    static IKEEXT_MM_FAILURE => 0

    /**
     * An IKE/AuthIP quick mode failure has occurred.
     * Native name: FWPM_NET_EVENT_TYPE_IKEEXT_QM_FAILURE
     * @type {Integer (Int32)}
     */
    static IKEEXT_QM_FAILURE => 1

    /**
     * An AuthIP extended mode failure has occurred.
     * Native name: FWPM_NET_EVENT_TYPE_IKEEXT_EM_FAILURE
     * @type {Integer (Int32)}
     */
    static IKEEXT_EM_FAILURE => 2

    /**
     * A drop event has occurred.
     * Native name: FWPM_NET_EVENT_TYPE_CLASSIFY_DROP
     * @type {Integer (Int32)}
     */
    static CLASSIFY_DROP => 3

    /**
     * An IPsec kernel drop event has occurred.
     * Native name: FWPM_NET_EVENT_TYPE_IPSEC_KERNEL_DROP
     * @type {Integer (Int32)}
     */
    static IPSEC_KERNEL_DROP => 4

    /**
     * An IPsec DoS Protection drop event has occurred.
     * 
     * <div class="alert"><b>Note</b>  Available only in Windows 7, Windows Server 2008 R2, and later.</div>
     * <div> </div>
     * Native name: FWPM_NET_EVENT_TYPE_IPSEC_DOSP_DROP
     * @type {Integer (Int32)}
     */
    static IPSEC_DOSP_DROP => 5

    /**
     * An allow event has occurred.
     * 
     * <div class="alert"><b>Note</b>  Available only in Windows 8 and Windows Server 2012.</div>
     * <div> </div>
     * Native name: FWPM_NET_EVENT_TYPE_CLASSIFY_ALLOW
     * @type {Integer (Int32)}
     */
    static CLASSIFY_ALLOW => 6

    /**
     * An app container network capability drop event has occurred.
     * 
     * <div class="alert"><b>Note</b>  Available only in Windows 8 and Windows Server 2012.</div>
     * <div> </div>
     * Native name: FWPM_NET_EVENT_TYPE_CAPABILITY_DROP
     * @type {Integer (Int32)}
     */
    static CAPABILITY_DROP => 7

    /**
     * An app container network capability allow event has occurred.
     * 
     * <div class="alert"><b>Note</b>  Available only in Windows 8 and Windows Server 2012.</div>
     * <div> </div>
     * Native name: FWPM_NET_EVENT_TYPE_CAPABILITY_ALLOW
     * @type {Integer (Int32)}
     */
    static CAPABILITY_ALLOW => 8

    /**
     * A MAC layer drop event has occurred.
     * 
     * <div class="alert"><b>Note</b>  Available only in Windows 8 and Windows Server 2012.</div>
     * <div> </div>
     * Native name: FWPM_NET_EVENT_TYPE_CLASSIFY_DROP_MAC
     * @type {Integer (Int32)}
     */
    static CLASSIFY_DROP_MAC => 9

    /**
     * Native name: FWPM_NET_EVENT_TYPE_LPM_PACKET_ARRIVAL
     * @type {Integer (Int32)}
     */
    static LPM_PACKET_ARRIVAL => 10

    /**
     * Maximum value for testing purposes.
     * Native name: FWPM_NET_EVENT_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 11
}
