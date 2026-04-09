#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_TELEPHONY_TOPOLOGY extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TELEPHONY_ENDPOINTIDPAIR => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TELEPHONY_VOLUME => 1
}
