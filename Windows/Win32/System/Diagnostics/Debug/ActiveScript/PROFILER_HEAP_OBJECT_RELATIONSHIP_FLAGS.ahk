#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_IS_GET_ACCESSOR
     * @type {Integer (Int32)}
     */
    static IS_GET_ACCESSOR => 65536

    /**
     * Native name: PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_IS_SET_ACCESSOR
     * @type {Integer (Int32)}
     */
    static IS_SET_ACCESSOR => 131072

    /**
     * Native name: PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_LET_VARIABLE
     * @type {Integer (Int32)}
     */
    static LET_VARIABLE => 262144

    /**
     * Native name: PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_CONST_VARIABLE
     * @type {Integer (Int32)}
     */
    static CONST_VARIABLE => 524288
}
