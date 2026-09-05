#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_VIDCAP_CROSSBAR extends Win32Enum {

    /**
     * Native name: KSPROPERTY_CROSSBAR_CAPS
     * @type {Integer (Int32)}
     */
    static CAPS => 0

    /**
     * Native name: KSPROPERTY_CROSSBAR_PININFO
     * @type {Integer (Int32)}
     */
    static PININFO => 1

    /**
     * Native name: KSPROPERTY_CROSSBAR_CAN_ROUTE
     * @type {Integer (Int32)}
     */
    static CAN_ROUTE => 2

    /**
     * Native name: KSPROPERTY_CROSSBAR_ROUTE
     * @type {Integer (Int32)}
     */
    static ROUTE => 3

    /**
     * Native name: KSPROPERTY_CROSSBAR_INPUT_ACTIVE
     * @type {Integer (Int32)}
     */
    static INPUT_ACTIVE => 4
}
