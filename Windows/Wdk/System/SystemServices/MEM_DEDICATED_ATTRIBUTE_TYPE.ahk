#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class MEM_DEDICATED_ATTRIBUTE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MemDedicatedAttributeReadBandwidth => 0

    /**
     * @type {Integer (Int32)}
     */
    static MemDedicatedAttributeReadLatency => 1

    /**
     * @type {Integer (Int32)}
     */
    static MemDedicatedAttributeWriteBandwidth => 2

    /**
     * @type {Integer (Int32)}
     */
    static MemDedicatedAttributeWriteLatency => 3

    /**
     * @type {Integer (Int32)}
     */
    static MemDedicatedAttributeMax => 4
}
