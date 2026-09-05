#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_CONNECTION extends Win32Enum {

    /**
     * Native name: KSPROPERTY_CONNECTION_STATE
     * @type {Integer (Int32)}
     */
    static STATE => 0

    /**
     * Native name: KSPROPERTY_CONNECTION_PRIORITY
     * @type {Integer (Int32)}
     */
    static PRIORITY => 1

    /**
     * Native name: KSPROPERTY_CONNECTION_DATAFORMAT
     * @type {Integer (Int32)}
     */
    static DATAFORMAT => 2

    /**
     * Native name: KSPROPERTY_CONNECTION_ALLOCATORFRAMING
     * @type {Integer (Int32)}
     */
    static ALLOCATORFRAMING => 3

    /**
     * Native name: KSPROPERTY_CONNECTION_PROPOSEDATAFORMAT
     * @type {Integer (Int32)}
     */
    static PROPOSEDATAFORMAT => 4

    /**
     * Native name: KSPROPERTY_CONNECTION_ACQUIREORDERING
     * @type {Integer (Int32)}
     */
    static ACQUIREORDERING => 5

    /**
     * Native name: KSPROPERTY_CONNECTION_ALLOCATORFRAMING_EX
     * @type {Integer (Int32)}
     */
    static ALLOCATORFRAMING_EX => 6

    /**
     * Native name: KSPROPERTY_CONNECTION_STARTAT
     * @type {Integer (Int32)}
     */
    static STARTAT => 7
}
