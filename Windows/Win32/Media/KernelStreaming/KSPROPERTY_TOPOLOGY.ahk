#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_TOPOLOGY extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TOPOLOGY_CATEGORIES => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TOPOLOGY_NODES => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TOPOLOGY_CONNECTIONS => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TOPOLOGY_NAME => 3
}
