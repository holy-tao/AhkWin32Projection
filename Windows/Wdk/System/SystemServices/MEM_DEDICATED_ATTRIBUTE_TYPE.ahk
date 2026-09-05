#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class MEM_DEDICATED_ATTRIBUTE_TYPE extends Win32Enum {

    /**
     * Native name: MemDedicatedAttributeReadBandwidth
     * @type {Integer (Int32)}
     */
    static ReadBandwidth => 0

    /**
     * Native name: MemDedicatedAttributeReadLatency
     * @type {Integer (Int32)}
     */
    static ReadLatency => 1

    /**
     * Native name: MemDedicatedAttributeWriteBandwidth
     * @type {Integer (Int32)}
     */
    static WriteBandwidth => 2

    /**
     * Native name: MemDedicatedAttributeWriteLatency
     * @type {Integer (Int32)}
     */
    static WriteLatency => 3

    /**
     * Native name: MemDedicatedAttributeMax
     * @type {Integer (Int32)}
     */
    static Max => 4
}
