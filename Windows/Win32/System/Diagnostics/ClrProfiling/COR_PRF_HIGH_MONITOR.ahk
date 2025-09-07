#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class COR_PRF_HIGH_MONITOR{

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_HIGH_MONITOR_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_HIGH_ADD_ASSEMBLY_REFERENCES => 1

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_HIGH_IN_MEMORY_SYMBOLS_UPDATED => 2

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_HIGH_MONITOR_DYNAMIC_FUNCTION_UNLOADS => 4

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_HIGH_DISABLE_TIERED_COMPILATION => 8

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_HIGH_BASIC_GC => 16

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_HIGH_MONITOR_GC_MOVED_OBJECTS => 32

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_HIGH_REQUIRE_PROFILE_IMAGE => 0

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_HIGH_MONITOR_LARGEOBJECT_ALLOCATED => 64

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_HIGH_MONITOR_EVENT_PIPE => 128

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_HIGH_MONITOR_PINNEDOBJECT_ALLOCATED => 256

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_HIGH_ALLOWABLE_AFTER_ATTACH => 246

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_HIGH_ALLOWABLE_NOTIFICATION_PROFILER => 254

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_HIGH_MONITOR_IMMUTABLE => 8
}
