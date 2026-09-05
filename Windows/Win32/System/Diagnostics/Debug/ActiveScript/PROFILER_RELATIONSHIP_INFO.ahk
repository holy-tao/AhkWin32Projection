#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class PROFILER_RELATIONSHIP_INFO extends Win32Enum {

    /**
     * Native name: PROFILER_PROPERTY_TYPE_NUMBER
     * @type {Integer (Int32)}
     */
    static PROPERTY_TYPE_NUMBER => 1

    /**
     * Native name: PROFILER_PROPERTY_TYPE_STRING
     * @type {Integer (Int32)}
     */
    static PROPERTY_TYPE_STRING => 2

    /**
     * Native name: PROFILER_PROPERTY_TYPE_HEAP_OBJECT
     * @type {Integer (Int32)}
     */
    static PROPERTY_TYPE_HEAP_OBJECT => 3

    /**
     * Native name: PROFILER_PROPERTY_TYPE_EXTERNAL_OBJECT
     * @type {Integer (Int32)}
     */
    static PROPERTY_TYPE_EXTERNAL_OBJECT => 4

    /**
     * Native name: PROFILER_PROPERTY_TYPE_BSTR
     * @type {Integer (Int32)}
     */
    static PROPERTY_TYPE_BSTR => 5

    /**
     * Native name: PROFILER_PROPERTY_TYPE_SUBSTRING
     * @type {Integer (Int32)}
     */
    static PROPERTY_TYPE_SUBSTRING => 6
}
