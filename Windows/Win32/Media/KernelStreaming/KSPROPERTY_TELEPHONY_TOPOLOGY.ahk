#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_TELEPHONY_TOPOLOGY extends Win32Enum {

    /**
     * Native name: KSPROPERTY_TELEPHONY_ENDPOINTIDPAIR
     * @type {Integer (Int32)}
     */
    static ENDPOINTIDPAIR => 0

    /**
     * Native name: KSPROPERTY_TELEPHONY_VOLUME
     * @type {Integer (Int32)}
     */
    static VOLUME => 1
}
