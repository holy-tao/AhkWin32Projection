#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class PROFILER_RELATIONSHIP_INFO extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_PROPERTY_TYPE_NUMBER => 1

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_PROPERTY_TYPE_STRING => 2

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_PROPERTY_TYPE_HEAP_OBJECT => 3

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_PROPERTY_TYPE_EXTERNAL_OBJECT => 4

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_PROPERTY_TYPE_BSTR => 5

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_PROPERTY_TYPE_SUBSTRING => 6
}
