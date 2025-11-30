#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Configurable options for the filter engine.
 * @see https://docs.microsoft.com/windows/win32/api//fwpmtypes/ne-fwpmtypes-fwpm_engine_option
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_ENGINE_OPTION extends Win32Enum{

    /**
     * The filter engine will collect WFP network events.
     * @type {Integer (Int32)}
     */
    static FWPM_ENGINE_COLLECT_NET_EVENTS => 0

    /**
     * The filter engine will collect WFP network events that match any supplied key words.
     * @type {Integer (Int32)}
     */
    static FWPM_ENGINE_NET_EVENT_MATCH_ANY_KEYWORDS => 1

    /**
     * Reserved for internal use.
     * 
     * <div class="alert"><b>Note</b>  Available only in Windows Server 2008 R2, Windows 7, and later.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static FWPM_ENGINE_NAME_CACHE => 2

    /**
     * Enables the connection monitoring feature and starts logging creation and deletion events (and notifying any subscribers).
     * 
     * 
     * If the ETW operational log is already enabled, <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmenginegetoption0">FwpmEngineGetOption0</a> will return showing the option as enabled. <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmenginesetoption0">FwpmEngineSetOption0</a> can be used set the value (but fails with FWP_E_STILL_ON ERROR when attempting to disable it).
     * 
     * 
     * <div class="alert"><b>Note</b>  Available only in Windows 8 and Windows Server 2012.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static FWPM_ENGINE_MONITOR_IPSEC_CONNECTIONS => 3

    /**
     * Enables inbound or forward packet queuing independently.   When enabled, the system is able to evenly distribute CPU load to multiple CPUs for site-to-site IPsec tunnel scenarios.
     * 
     * <div class="alert"><b>Note</b>  Available only in Windows 8 and Windows Server 2012.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static FWPM_ENGINE_PACKET_QUEUING => 4

    /**
     * Transactions lasting longer than this time (in milliseconds) will trigger a
     *    watchdog event.
     * 
     * 
     * <div class="alert"><b>Note</b>  Available only in Windows 8 and Windows Server 2012.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static FWPM_ENGINE_TXN_WATCHDOG_TIMEOUT_IN_MSEC => 5

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static FWPM_ENGINE_OPTION_MAX => 6
}
