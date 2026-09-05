#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_TOPOLOGY extends Win32Enum {

    /**
     * Native name: KSPROPERTY_TOPOLOGY_CATEGORIES
     * @type {Integer (Int32)}
     */
    static CATEGORIES => 0

    /**
     * Native name: KSPROPERTY_TOPOLOGY_NODES
     * @type {Integer (Int32)}
     */
    static NODES => 1

    /**
     * Native name: KSPROPERTY_TOPOLOGY_CONNECTIONS
     * @type {Integer (Int32)}
     */
    static CONNECTIONS => 2

    /**
     * Native name: KSPROPERTY_TOPOLOGY_NAME
     * @type {Integer (Int32)}
     */
    static NAME => 3
}
