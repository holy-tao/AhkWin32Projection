#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how to reconnect filters when dynamically rebuilding the filter graph.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-am_graph_config_reconnect_flags
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_GRAPH_CONFIG_RECONNECT_FLAGS{

    /**
     * Do not insert additional filters into the graph while reconnecting, aside from any filter explicitly requested.
     * @type {Integer (Int32)}
     */
    static AM_GRAPH_CONFIG_RECONNECT_DIRECTCONNECT => 1

    /**
     * Place filters removed from the graph into the filter cache.
     * @type {Integer (Int32)}
     */
    static AM_GRAPH_CONFIG_RECONNECT_CACHE_REMOVED_FILTERS => 2

    /**
     * When inserting additional filters into the graph, use only filters currently in the filter cache.
     * @type {Integer (Int32)}
     */
    static AM_GRAPH_CONFIG_RECONNECT_USE_ONLY_CACHED_FILTERS => 4
}
