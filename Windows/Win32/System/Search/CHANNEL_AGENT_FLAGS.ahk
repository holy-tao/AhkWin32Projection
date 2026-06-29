#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct CHANNEL_AGENT_FLAGS {
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
    static CHANNEL_AGENT_DYNAMIC_SCHEDULE => 1

    /**
     * @type {Integer (Int32)}
     */
    static CHANNEL_AGENT_PRECACHE_SOME => 2

    /**
     * @type {Integer (Int32)}
     */
    static CHANNEL_AGENT_PRECACHE_ALL => 4

    /**
     * @type {Integer (Int32)}
     */
    static CHANNEL_AGENT_PRECACHE_SCRNSAVER => 8
}
