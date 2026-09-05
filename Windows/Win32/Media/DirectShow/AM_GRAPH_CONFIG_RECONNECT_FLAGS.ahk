#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how to reconnect filters when dynamically rebuilding the filter graph.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-am_graph_config_reconnect_flags
 * @namespace Windows.Win32.Media.DirectShow
 */
class AM_GRAPH_CONFIG_RECONNECT_FLAGS extends Win32Enum {

    /**
     * Do not insert additional filters into the graph while reconnecting, aside from any filter explicitly requested.
     * Native name: AM_GRAPH_CONFIG_RECONNECT_DIRECTCONNECT
     * @type {Integer (Int32)}
     */
    static DIRECTCONNECT => 1

    /**
     * Place filters removed from the graph into the filter cache.
     * Native name: AM_GRAPH_CONFIG_RECONNECT_CACHE_REMOVED_FILTERS
     * @type {Integer (Int32)}
     */
    static CACHE_REMOVED_FILTERS => 2

    /**
     * When inserting additional filters into the graph, use only filters currently in the filter cache.
     * Native name: AM_GRAPH_CONFIG_RECONNECT_USE_ONLY_CACHED_FILTERS
     * @type {Integer (Int32)}
     */
    static USE_ONLY_CACHED_FILTERS => 4
}
