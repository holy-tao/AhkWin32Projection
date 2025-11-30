#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_VIDCAP_CROSSBAR extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CROSSBAR_CAPS => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CROSSBAR_PININFO => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CROSSBAR_CAN_ROUTE => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CROSSBAR_ROUTE => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CROSSBAR_INPUT_ACTIVE => 4
}
