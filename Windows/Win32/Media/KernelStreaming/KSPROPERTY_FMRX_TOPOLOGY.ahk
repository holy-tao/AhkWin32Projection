#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_FMRX_TOPOLOGY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_FMRX_ENDPOINTID => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_FMRX_VOLUME => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_FMRX_ANTENNAENDPOINTID => 2
}
