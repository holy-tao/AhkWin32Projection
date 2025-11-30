#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class PROFILER_HEAP_OBJECT_OPTIONAL_INFO_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_OPTIONAL_INFO_PROTOTYPE => 1

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_OPTIONAL_INFO_FUNCTION_NAME => 2

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_OPTIONAL_INFO_SCOPE_LIST => 3

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_OPTIONAL_INFO_INTERNAL_PROPERTY => 4

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_OPTIONAL_INFO_NAME_PROPERTIES => 5

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_OPTIONAL_INFO_INDEX_PROPERTIES => 6

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_OPTIONAL_INFO_ELEMENT_ATTRIBUTES_SIZE => 7

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_OPTIONAL_INFO_ELEMENT_TEXT_CHILDREN_SIZE => 8

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_OPTIONAL_INFO_RELATIONSHIPS => 9

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_OPTIONAL_INFO_WINRTEVENTS => 10

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_OPTIONAL_INFO_WEAKMAP_COLLECTION_LIST => 11

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_OPTIONAL_INFO_MAP_COLLECTION_LIST => 12

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_OPTIONAL_INFO_SET_COLLECTION_LIST => 13

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_OPTIONAL_INFO_MAX_VALUE => 13
}
