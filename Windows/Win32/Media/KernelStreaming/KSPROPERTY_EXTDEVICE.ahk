#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_EXTDEVICE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_EXTDEVICE_ID => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_EXTDEVICE_VERSION => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_EXTDEVICE_POWER_STATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_EXTDEVICE_PORT => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_EXTDEVICE_CAPABILITIES => 4
}
