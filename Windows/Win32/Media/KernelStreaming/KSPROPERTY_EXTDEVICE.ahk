#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_EXTDEVICE extends Win32Enum {

    /**
     * Native name: KSPROPERTY_EXTDEVICE_ID
     * @type {Integer (Int32)}
     */
    static ID => 0

    /**
     * Native name: KSPROPERTY_EXTDEVICE_VERSION
     * @type {Integer (Int32)}
     */
    static VERSION => 1

    /**
     * Native name: KSPROPERTY_EXTDEVICE_POWER_STATE
     * @type {Integer (Int32)}
     */
    static POWER_STATE => 2

    /**
     * Native name: KSPROPERTY_EXTDEVICE_PORT
     * @type {Integer (Int32)}
     */
    static PORT => 3

    /**
     * Native name: KSPROPERTY_EXTDEVICE_CAPABILITIES
     * @type {Integer (Int32)}
     */
    static CAPABILITIES => 4
}
