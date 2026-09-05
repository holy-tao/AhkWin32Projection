#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class PROFILER_HEAP_ENUM_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: PROFILER_HEAP_ENUM_FLAGS_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: PROFILER_HEAP_ENUM_FLAGS_STORE_RELATIONSHIP_FLAGS
     * @type {Integer (Int32)}
     */
    static STORE_RELATIONSHIP_FLAGS => 1

    /**
     * Native name: PROFILER_HEAP_ENUM_FLAGS_SUBSTRINGS
     * @type {Integer (Int32)}
     */
    static SUBSTRINGS => 2

    /**
     * Native name: PROFILER_HEAP_ENUM_FLAGS_RELATIONSHIP_SUBSTRINGS
     * @type {Integer (Int32)}
     */
    static RELATIONSHIP_SUBSTRINGS => 3
}
