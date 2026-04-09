#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_VIDCAP_TVAUDIO extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TVAUDIO_CAPS => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TVAUDIO_MODE => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TVAUDIO_CURRENTLY_AVAILABLE_MODES => 2
}
