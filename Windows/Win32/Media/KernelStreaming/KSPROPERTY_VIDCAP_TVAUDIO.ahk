#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_VIDCAP_TVAUDIO extends Win32Enum {

    /**
     * Native name: KSPROPERTY_TVAUDIO_CAPS
     * @type {Integer (Int32)}
     */
    static CAPS => 0

    /**
     * Native name: KSPROPERTY_TVAUDIO_MODE
     * @type {Integer (Int32)}
     */
    static MODE => 1

    /**
     * Native name: KSPROPERTY_TVAUDIO_CURRENTLY_AVAILABLE_MODES
     * @type {Integer (Int32)}
     */
    static CURRENTLY_AVAILABLE_MODES => 2
}
