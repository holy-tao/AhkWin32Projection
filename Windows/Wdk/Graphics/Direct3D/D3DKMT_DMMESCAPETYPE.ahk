#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_DMMESCAPETYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DMMESCAPETYPE_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DMMESCAPETYPE_GET_SUMMARY_INFO => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DMMESCAPETYPE_GET_VIDEO_PRESENT_SOURCES_INFO => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DMMESCAPETYPE_GET_VIDEO_PRESENT_TARGETS_INFO => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DMMESCAPETYPE_GET_ACTIVEVIDPN_INFO => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DMMESCAPETYPE_GET_MONITORS_INFO => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DMMESCAPETYPE_RECENTLY_COMMITTED_VIDPNS_INFO => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DMMESCAPETYPE_RECENT_MODECHANGE_REQUESTS_INFO => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DMMESCAPETYPE_RECENTLY_RECOMMENDED_VIDPNS_INFO => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DMMESCAPETYPE_RECENT_MONITOR_PRESENCE_EVENTS_INFO => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DMMESCAPETYPE_ACTIVEVIDPN_SOURCEMODESET_INFO => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DMMESCAPETYPE_ACTIVEVIDPN_COFUNCPATHMODALITY_INFO => 11

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DMMESCAPETYPE_GET_LASTCLIENTCOMMITTEDVIDPN_INFO => 12

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DMMESCAPETYPE_GET_VERSION_INFO => 13

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DMMESCAPETYPE_VIDPN_MGR_DIAGNOSTICS => 14
}
