#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class PROFILER_HEAP_ENUM_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_ENUM_FLAGS_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_ENUM_FLAGS_STORE_RELATIONSHIP_FLAGS => 1

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_ENUM_FLAGS_SUBSTRINGS => 2

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_ENUM_FLAGS_RELATIONSHIP_SUBSTRINGS => 3
}
