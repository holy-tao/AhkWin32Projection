#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_DMMESCAPETYPE extends Win32Enum {

    /**
     * Native name: D3DKMT_DMMESCAPETYPE_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static UNINITIALIZED => 0

    /**
     * Native name: D3DKMT_DMMESCAPETYPE_GET_SUMMARY_INFO
     * @type {Integer (Int32)}
     */
    static GET_SUMMARY_INFO => 1

    /**
     * Native name: D3DKMT_DMMESCAPETYPE_GET_VIDEO_PRESENT_SOURCES_INFO
     * @type {Integer (Int32)}
     */
    static GET_VIDEO_PRESENT_SOURCES_INFO => 2

    /**
     * Native name: D3DKMT_DMMESCAPETYPE_GET_VIDEO_PRESENT_TARGETS_INFO
     * @type {Integer (Int32)}
     */
    static GET_VIDEO_PRESENT_TARGETS_INFO => 3

    /**
     * Native name: D3DKMT_DMMESCAPETYPE_GET_ACTIVEVIDPN_INFO
     * @type {Integer (Int32)}
     */
    static GET_ACTIVEVIDPN_INFO => 4

    /**
     * Native name: D3DKMT_DMMESCAPETYPE_GET_MONITORS_INFO
     * @type {Integer (Int32)}
     */
    static GET_MONITORS_INFO => 5

    /**
     * Native name: D3DKMT_DMMESCAPETYPE_RECENTLY_COMMITTED_VIDPNS_INFO
     * @type {Integer (Int32)}
     */
    static RECENTLY_COMMITTED_VIDPNS_INFO => 6

    /**
     * Native name: D3DKMT_DMMESCAPETYPE_RECENT_MODECHANGE_REQUESTS_INFO
     * @type {Integer (Int32)}
     */
    static RECENT_MODECHANGE_REQUESTS_INFO => 7

    /**
     * Native name: D3DKMT_DMMESCAPETYPE_RECENTLY_RECOMMENDED_VIDPNS_INFO
     * @type {Integer (Int32)}
     */
    static RECENTLY_RECOMMENDED_VIDPNS_INFO => 8

    /**
     * Native name: D3DKMT_DMMESCAPETYPE_RECENT_MONITOR_PRESENCE_EVENTS_INFO
     * @type {Integer (Int32)}
     */
    static RECENT_MONITOR_PRESENCE_EVENTS_INFO => 9

    /**
     * Native name: D3DKMT_DMMESCAPETYPE_ACTIVEVIDPN_SOURCEMODESET_INFO
     * @type {Integer (Int32)}
     */
    static ACTIVEVIDPN_SOURCEMODESET_INFO => 10

    /**
     * Native name: D3DKMT_DMMESCAPETYPE_ACTIVEVIDPN_COFUNCPATHMODALITY_INFO
     * @type {Integer (Int32)}
     */
    static ACTIVEVIDPN_COFUNCPATHMODALITY_INFO => 11

    /**
     * Native name: D3DKMT_DMMESCAPETYPE_GET_LASTCLIENTCOMMITTEDVIDPN_INFO
     * @type {Integer (Int32)}
     */
    static GET_LASTCLIENTCOMMITTEDVIDPN_INFO => 12

    /**
     * Native name: D3DKMT_DMMESCAPETYPE_GET_VERSION_INFO
     * @type {Integer (Int32)}
     */
    static GET_VERSION_INFO => 13

    /**
     * Native name: D3DKMT_DMMESCAPETYPE_VIDPN_MGR_DIAGNOSTICS
     * @type {Integer (Int32)}
     */
    static VIDPN_MGR_DIAGNOSTICS => 14
}
