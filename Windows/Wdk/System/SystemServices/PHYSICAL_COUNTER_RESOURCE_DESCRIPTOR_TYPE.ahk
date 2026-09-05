#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PHYSICAL_COUNTER_RESOURCE_DESCRIPTOR_TYPE extends Win32Enum {

    /**
     * Native name: ResourceTypeSingle
     * @type {Integer (Int32)}
     */
    static Single => 0

    /**
     * Native name: ResourceTypeRange
     * @type {Integer (Int32)}
     */
    static Range => 1

    /**
     * Native name: ResourceTypeExtendedCounterConfiguration
     * @type {Integer (Int32)}
     */
    static ExtendedCounterConfiguration => 2

    /**
     * Native name: ResourceTypeOverflow
     * @type {Integer (Int32)}
     */
    static Overflow => 3

    /**
     * Native name: ResourceTypeEventBuffer
     * @type {Integer (Int32)}
     */
    static EventBuffer => 4

    /**
     * Native name: ResourceTypeIdenitificationTag
     * @type {Integer (Int32)}
     */
    static IdenitificationTag => 5

    /**
     * Native name: ResourceTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 6
}
