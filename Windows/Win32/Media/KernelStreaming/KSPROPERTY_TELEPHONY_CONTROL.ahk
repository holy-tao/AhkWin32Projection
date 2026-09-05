#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_TELEPHONY_CONTROL extends Win32Enum {

    /**
     * Native name: KSPROPERTY_TELEPHONY_PROVIDERID
     * @type {Integer (Int32)}
     */
    static PROVIDERID => 0

    /**
     * Native name: KSPROPERTY_TELEPHONY_CALLINFO
     * @type {Integer (Int32)}
     */
    static CALLINFO => 1

    /**
     * Native name: KSPROPERTY_TELEPHONY_CALLCONTROL
     * @type {Integer (Int32)}
     */
    static CALLCONTROL => 2

    /**
     * Native name: KSPROPERTY_TELEPHONY_PROVIDERCHANGE
     * @type {Integer (Int32)}
     */
    static PROVIDERCHANGE => 3

    /**
     * Native name: KSPROPERTY_TELEPHONY_CALLHOLD
     * @type {Integer (Int32)}
     */
    static CALLHOLD => 4

    /**
     * Native name: KSPROPERTY_TELEPHONY_MUTE_TX
     * @type {Integer (Int32)}
     */
    static MUTE_TX => 5
}
