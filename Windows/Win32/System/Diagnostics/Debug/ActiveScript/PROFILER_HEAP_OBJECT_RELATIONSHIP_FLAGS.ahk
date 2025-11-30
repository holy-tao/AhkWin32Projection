#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_IS_GET_ACCESSOR => 65536

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_IS_SET_ACCESSOR => 131072

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_LET_VARIABLE => 262144

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_CONST_VARIABLE => 524288
}
