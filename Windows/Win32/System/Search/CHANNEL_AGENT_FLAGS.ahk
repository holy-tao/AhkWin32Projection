#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class CHANNEL_AGENT_FLAGS extends Win32Enum {

    /**
     * Native name: CHANNEL_AGENT_DYNAMIC_SCHEDULE
     * @type {Integer (Int32)}
     */
    static DYNAMIC_SCHEDULE => 1

    /**
     * Native name: CHANNEL_AGENT_PRECACHE_SOME
     * @type {Integer (Int32)}
     */
    static PRECACHE_SOME => 2

    /**
     * Native name: CHANNEL_AGENT_PRECACHE_ALL
     * @type {Integer (Int32)}
     */
    static PRECACHE_ALL => 4

    /**
     * Native name: CHANNEL_AGENT_PRECACHE_SCRNSAVER
     * @type {Integer (Int32)}
     */
    static PRECACHE_SCRNSAVER => 8
}
