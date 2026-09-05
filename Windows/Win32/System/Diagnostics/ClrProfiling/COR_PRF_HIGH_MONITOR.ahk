#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
class COR_PRF_HIGH_MONITOR extends Win32Enum {

    /**
     * Native name: COR_PRF_HIGH_MONITOR_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: COR_PRF_HIGH_ADD_ASSEMBLY_REFERENCES
     * @type {Integer (Int32)}
     */
    static ADD_ASSEMBLY_REFERENCES => 1

    /**
     * Native name: COR_PRF_HIGH_IN_MEMORY_SYMBOLS_UPDATED
     * @type {Integer (Int32)}
     */
    static IN_MEMORY_SYMBOLS_UPDATED => 2

    /**
     * Native name: COR_PRF_HIGH_MONITOR_DYNAMIC_FUNCTION_UNLOADS
     * @type {Integer (Int32)}
     */
    static DYNAMIC_FUNCTION_UNLOADS => 4

    /**
     * Native name: COR_PRF_HIGH_DISABLE_TIERED_COMPILATION
     * @type {Integer (Int32)}
     */
    static DISABLE_TIERED_COMPILATION => 8

    /**
     * Native name: COR_PRF_HIGH_BASIC_GC
     * @type {Integer (Int32)}
     */
    static BASIC_GC => 16

    /**
     * Native name: COR_PRF_HIGH_MONITOR_GC_MOVED_OBJECTS
     * @type {Integer (Int32)}
     */
    static GC_MOVED_OBJECTS => 32

    /**
     * Native name: COR_PRF_HIGH_REQUIRE_PROFILE_IMAGE
     * @type {Integer (Int32)}
     */
    static REQUIRE_PROFILE_IMAGE => 0

    /**
     * Native name: COR_PRF_HIGH_MONITOR_LARGEOBJECT_ALLOCATED
     * @type {Integer (Int32)}
     */
    static LARGEOBJECT_ALLOCATED => 64

    /**
     * Native name: COR_PRF_HIGH_MONITOR_EVENT_PIPE
     * @type {Integer (Int32)}
     */
    static EVENT_PIPE => 128

    /**
     * Native name: COR_PRF_HIGH_MONITOR_PINNEDOBJECT_ALLOCATED
     * @type {Integer (Int32)}
     */
    static PINNEDOBJECT_ALLOCATED => 256

    /**
     * Native name: COR_PRF_HIGH_ALLOWABLE_AFTER_ATTACH
     * @type {Integer (Int32)}
     */
    static ALLOWABLE_AFTER_ATTACH => 246

    /**
     * Native name: COR_PRF_HIGH_ALLOWABLE_NOTIFICATION_PROFILER
     * @type {Integer (Int32)}
     */
    static ALLOWABLE_NOTIFICATION_PROFILER => 254

    /**
     * Native name: COR_PRF_HIGH_MONITOR_IMMUTABLE
     * @type {Integer (Int32)}
     */
    static IMMUTABLE => 8
}
