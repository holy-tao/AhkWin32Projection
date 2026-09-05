#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_FMRX_TOPOLOGY extends Win32Enum {

    /**
     * Native name: KSPROPERTY_FMRX_ENDPOINTID
     * @type {Integer (Int32)}
     */
    static ENDPOINTID => 0

    /**
     * Native name: KSPROPERTY_FMRX_VOLUME
     * @type {Integer (Int32)}
     */
    static VOLUME => 1

    /**
     * Native name: KSPROPERTY_FMRX_ANTENNAENDPOINTID
     * @type {Integer (Int32)}
     */
    static ANTENNAENDPOINTID => 2
}
